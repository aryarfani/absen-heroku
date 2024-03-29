<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{

    public $loginAfterSignUp = true;

    public function register(Request $request)
    {
        $this->validate($request, [
            'name' => ['required', 'min:5', 'max:40'],
            'email' => ['required', 'min:5', 'max:40'],
            'address' => ['required', 'min:5', 'max:40'],
            'phone' => ['required', 'min:5', 'max:40'],
            'npm' => ['required', 'size:15'],
            'password' => ['required', 'min:5', 'max:40'],
            'gambar' => ['required', 'image', 'max:1000'],
        ]);

        $image = $request->file('gambar');

        $new_name = rand() . '.' . $image->getClientOriginalExtension();
        $image->move(base_path('public/images'), $new_name);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'npm' => $request->npm,
            'address' => $request->address,
            'gambar' => $new_name,
            'password' => bcrypt($request->password),
        ]);

        $token = auth()->login($user);

        return $this->respondWithToken($token);
    }

    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }

    public function getAuthUser()
    {
        return response()->json(auth()->user());
    }

    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
        ]);
    }

    //* Fungsi mendapat kehadiran  user
    public function getKehadiran($id)
    {
        $user = User::find($id);

        return response()->json($user->kehadiran->sortByDesc('id')->values());
    }

    //* Fungsi mengupdate data user
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => ['required', 'min:5', 'max:40'],
            'email' => ['required', 'min:5', 'max:40'],
            'address' => ['required', 'min:5', 'max:40'],
            'phone' => ['required', 'min:5', 'max:40'],
            'npm' => ['required', 'size:15'],
            'password' => ['nullable', 'min:5', 'max:40'],
            'gambar' => ['nullable', 'image', 'max:1000'],
        ]);

        $member = User::findOrFail($id);

        //* mengambil gambar lama
        $gambar_lama = $member->gambar;
        $password_lama = $member->password;

        $member->name = $request->name;
        $member->email = $request->email;
        $member->phone = $request->phone;
        $member->npm = $request->npm;
        $member->address = $request->address;

        //* jika password kosong gunakan password lama
        if (is_null($request->password)) {
            $member->password = $password_lama;
        } else {
            $member->password = bcrypt($request->password);
        }

        //* Jika gambar kosong maka query gambar
        //* menggunakan gambar_lama yg berisi gambar lama
        if (is_null($request->gambar)) {
            $member->gambar = $gambar_lama;
        } else {
            //* Jika ada query gambar maka akan diganti
            $image = $request->file('gambar');

            $new_name = rand() . '.' . $image->getClientOriginalExtension();
            $image->move(base_path('public/images'), $new_name);

            $member->gambar = $new_name;
        }

        $member->save();

        return response()->json($member);
    }

    public function getAllUser()
    {
        $user = User::all();

        return response()->json($user);
    }
}
