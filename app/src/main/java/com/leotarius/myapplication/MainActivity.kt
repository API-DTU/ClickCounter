package com.leotarius.myapplication

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var count = 0;

        tap.setOnClickListener {
            count++
            counter.setText(count.toString())
        }

        reset.setOnClickListener {
            count = 0
            counter.setText(count.toString())
        }
    }
}