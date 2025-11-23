import { useEffect, useState } from 'react';
import { getEventLayout, getSeatBitmap } from '../api/seatMapApi';
import type { Zone } from '../api/seatMapApi';

interface SeatMapProps {
  eventId: string;
  zoneId: string;
}

const SeatMap = ({ eventId, zoneId }: SeatMapProps) => {
  const [loading, setLoading] = useState(true);
  const [seatData, setSeatData] = useState<boolean[] | null>(null);
  const [zoneInfo, setZoneInfo] = useState<Zone | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchSeatMap = async () => {
      try {
        setLoading(true);
        const layout = await getEventLayout(eventId);
        const zone = layout.find(z => z.zoneId.toString() === zoneId);
        if (!zone) {
          throw new Error('Zone not found');
        }
        setZoneInfo(zone);

        const seatBitMapResult = await getSeatBitmap(eventId, zoneId);
        console.log('Raw seatMap response:', seatBitMapResult);
        console.log('Base64 string:', seatBitMapResult.seatMapBase64);
        const decodedData = decodeBase64ToBooleanArray(seatBitMapResult.seatMapBase64);
        console.log('Decoded data length:', decodedData.length);
        console.log('Expected seats:', zone.width * zone.height);
        setSeatData(decodedData);
      } catch (err) {
        console.error('Error loading seat map:', err);
        setError(`Failed to Load Seat Map: ${err instanceof Error ? err.message : 'Unknown error'}`);
      } finally {
        setLoading(false);
      }
    };

    fetchSeatMap();
  }, [eventId, zoneId]);

  const decodeBase64ToBooleanArray = (base64String: string): boolean[] => {
    // Decode base 64 to binary
    const binaryString = atob(base64String);
    const bytes = new Uint8Array(binaryString.length);
    for (let i = 0; i < binaryString.length; i++) {
      bytes[i] = binaryString.charCodeAt(i);
    }

    // Turn binary into array showing which seat works
    const bits: boolean[] = [];
    for (const byte of bytes) {
      for (let i = 7; i >= 0; i--) {
        bits.push((byte & (1 << i)) !== 0);
      }
    }
    return bits;
  };

  if (loading) {
    return <div>Loading seat map...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  if (!seatData || !zoneInfo) {
    return <div>No seat data available</div>;
  }

  // For debugging: show first 100 bits
  const debugBits = seatData.slice(0, 100).map(b => b ? '1' : '0').join('');

  return (
    <div className="seat-map">
      <h2>Seat Map for Zone {zoneId}</h2>
      <p>Zone Info: {zoneInfo.width} x {zoneInfo.height}, Price: ${zoneInfo.ticketPrice}</p>
      <p>Seat Data Length: {seatData.length}, Expected: {zoneInfo.width * zoneInfo.height}</p>
      <p>Debug bits (first 100): {debugBits}</p>
      <div
        className="seat-grid"
        style={{
          display: 'grid',
          gridTemplateColumns: `repeat(${zoneInfo.width}, 1fr)`,
          gap: '2px',
        }}
      >
        {seatData.slice(0, zoneInfo.width * zoneInfo.height).map((isAvailable, index) => (
          <div
            key={index}
            className={`seat ${isAvailable ? 'available' : 'occupied'}`}
            style={{
              width: '20px',
              height: '20px',
              backgroundColor: isAvailable ? 'green' : 'red',
              border: '1px solid black',
            }}
          />
        ))}
      </div>
    </div>
  );
};

export default SeatMap;