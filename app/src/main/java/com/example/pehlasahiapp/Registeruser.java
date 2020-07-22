package com.example.pehlasahiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.EditText;
import android.widget.TextView;

import com.google.firebase.database.FirebaseDatabase;

public class Registeruser extends AppCompatActivity {
    public EditText entername;
    public EditText enterage;
    public EditText entermail;
    public EditText enterpass;
    public EditText entercity;
    public TextView name;
    public TextView city;
    public TextView password;
    public TextView age,mail;

    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registeruser);
        enterage=findViewById(R.id.enterage);
        entermail=findViewById(R.id.entermail);
        entername=findViewById(R.id.entername);
        enterpass=findViewById(R.id.enterpass);
        entercity=findViewById(R.id.entercity);
        age=findViewById(R.id.age);
        name=findViewById(R.id.name);
        city=findViewById(R.id.city);
        password=findViewById(R.id.password);
        mail=findViewById(R.id.mail);


    }
}
