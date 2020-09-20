<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\User::create([
            'name'  => 'Rifqi Arfani',
            'email' => 'rifqi@gmail.com',
            'address' => 'Kediri, Jatim',
            'phone' => '081234123423',
            'npm' => '18.1.03.02.0144',
            'gambar' => '1889207819.jpg',
            'password'  => bcrypt('rifqi123')
        ]);
    }
}
