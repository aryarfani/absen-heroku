<?php

namespace App\Http\Controllers;

use App\Jadwal;
use Illuminate\Http\Request;

class JadwalController extends Controller
{
    public function index()
    {
        $jadwal = Jadwal::all();
        return response()->json($jadwal);
    }

    public function store(Request $request)
    {
        $jadwal = new Jadwal();
        $jadwal->jadwal_hadir = $request->jadwal_hadir;
        $jadwal->jadwal_pulang = $request->jadwal_pulang;

        $jadwal->save();
        return response()->json($jadwal);
    }

    public function update(Request $request)
    {
        $jadwal = Jadwal::all()->first();
        $jadwal->jadwal_hadir = $request->jadwal_hadir;
        $jadwal->jadwal_pulang = $request->jadwal_pulang;

        $jadwal->save();
        return response()->json($jadwal);
    }
}
