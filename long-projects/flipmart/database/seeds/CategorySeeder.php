<?php

use Illuminate\Database\Seeder;
use App\Category;

class CategorySeeder extends Seeder
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
	        Category::create([
	        	'category_name' => $faker->name,
	        	'category_slug' => $faker->name,
	        	'status' => '1',
	        ]);
        }
    }
}
