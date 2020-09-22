<?php

use Illuminate\Database\Seeder;

class JadwalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Jadwal::create([
            'jadwal_hadir'  => '08:00',
            'jadwal_pulang' => '16:00',
        ]);
    }
}
