<?php

use Illuminate\Database\Seeder;
use App\Brand;

class BrandsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	$faker = Faker\Factory::create();
    	foreach (range(1, 10) as $index) {
	        Brand::create([
	        	'brand_name' => $faker->name,
	        	'brand_slug' => $faker->name,
	        	'status' => '1',
	        ]);
   		}
    }
}
