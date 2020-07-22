package com.example.pehlasahiapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.common.SignInButton;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

public EditText password;
public EditText email_id;
public Button signin;
public Button signup;
public TextView login;
private FirebaseAuth firebaseAuth;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        firebaseAuth=FirebaseAuth.getInstance();
        password=findViewById(R.id.password);
        email_id=findViewById(R.id.email_id);
        signin=findViewById(R.id.signin);
        signup=findViewById(R.id.signup);
        login=findViewById(R.id.login);
       signin.setOnClickListener(this);
       signup.setOnClickListener(this);
       firebaseAuth.createUserWithEmailAndPassword(email_id,password)
               .addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
                   @Override
                   public void onComplete(@NonNull Task<AuthResult> task) {
                       if(task.isSuccessful()){
                           
                       }
                   }
               });

    }
    @Override
    private void registeruser() {
       // Intent intent = new Intent(this, Registeruser.class);
        //startActivity(intent);



    }
    @Override
    public void onClick(View view) {
       if(view==signin)
           //new activity opens
           if (view==signup)
               registeruser();


    }
}