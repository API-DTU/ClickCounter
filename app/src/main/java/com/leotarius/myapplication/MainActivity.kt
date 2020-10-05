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
            //Change the color of button on every button click
            val rnd = Random()
            val color: Int = Color.argb(255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256))
            tap.setBackgroundColor(color)
        }

        reset.setOnClickListener {
            count = 0
            counter.setText(count.toString())
        }
    }
}
