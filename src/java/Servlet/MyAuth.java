/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author Pc
 */
public class MyAuth extends Authenticator{
    public PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication("fcaiservice@gmail.com", "waleedkamal");
    }
}
