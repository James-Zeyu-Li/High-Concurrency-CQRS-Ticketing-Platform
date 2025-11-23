import { http } from "./http";

export interface seat{
    version: number
    bits: string
    width: number
    height: number
}

export async function getSeatBitmap(eventId: string, zoneId: string) {
    const {data} = await http.get<seatBitmapResp> (
        //API to get seat bitmap

    )
    return data
}

export async function  holdSeat(params:{
    eventId: string
    zoneId: string
    seats: Array<{row: number; col: number}>
    expectedVersion?: number
    clientRequestId: string
}) {
    const {data} = await http.post('/v1/hold', params)
    return data as {ok: boolean; version: number; holdId: string; expiresAt:string}
}