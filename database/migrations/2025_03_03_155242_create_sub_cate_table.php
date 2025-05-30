<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('sub_cate')) {
            Schema::create('sub_cate', function (Blueprint $table) {
                $table->id();
                $table->string('name');
                $table->string('slug');
                $table->integer('status')->default(1);
                $table->integer('showHome')->default(1);
                $table->integer('cate_id');
                $table->timestamps();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sub_cate');
    }
};
