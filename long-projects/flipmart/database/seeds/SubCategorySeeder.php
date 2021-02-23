<?php

use Illuminate\Database\Seeder;
use App\SubCategory;

class SubCategorySeeder extends Seeder
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
	        SubCategory::create([
	        	'cat_id' => rand(1,9),
	        	'subcat_name' => $faker->name,
	        	'status' => '1',
	        ]);
        }
    }
}
