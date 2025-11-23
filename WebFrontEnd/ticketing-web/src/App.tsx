import './App.css'
import SeatMap from './seatConfig/SeatMap.tsx';

function App() {

  return (
    <>
      <div>
        <h1>Ticketing</h1>
        <SeatMap eventId="Event1" zoneId="2" />
      </div>
    </>
  )
}

export default App
