<?php

use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Location::create([
            'name' => 'Kampus 1',
            'address' => 'Jl. KH. Ahmad Dahlan, Mojoroto, Kec. Mojoroto, Kota Kediri, Jawa Timur 64112',
            'longitude' => '112.00286200',
            'latitude' => '-7.80012700'
        ]);
    }
}
