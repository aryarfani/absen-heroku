<?php

namespace App\Http\Controllers;

use App\Cuti;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CutiController extends Controller
{
    public function index()
    {
        return DB::table('cutis')
            ->join('users', 'users.id', '=', 'user_id')
            ->select('users.name as name', 'cutis.*')
            ->get();
    }
    public function getCutibyUserId($id)
    {
        $user = User::find($id);
        return response()->json($user->cuti->sortByDesc('created_at')->values());
    }

    public function store($id, Request $request)
    {
        $cuti = new Cuti();
        $cuti->user_id = $id;
        $cuti->judul = $request->judul;
        $cuti->keterangan = $request->keterangan;
        $cuti->tanggal_mulai = $request->tanggal_mulai;
        $cuti->tanggal_akhir = $request->tanggal_akhir;
        $cuti->status = $request->status;

        $cuti->save();
        return response()->json();
    }

    public function confirmCuti($id)
    {
        // Menconfirmasi cuti
        $cuti = Cuti::find($id);
        $cuti->update(array('status' => 1));
        return response()->json($cuti);
    }
}
