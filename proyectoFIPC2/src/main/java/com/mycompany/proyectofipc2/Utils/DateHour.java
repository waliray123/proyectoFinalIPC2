/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.Utils;

import com.mycompany.proyectofipc2.Objects.TypeTurn;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author user-ubunto
 */
public class DateHour {

    public String getDateToday() {
        Date objDate = new Date();
        String strDateFormat = "yyyy-MM-dd";
        SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat);
        String dateToday = objSDF.format(objDate);
        return dateToday;
    }

    public String getTime() {
        Calendar calendario = Calendar.getInstance();
        int hora = calendario.get(Calendar.HOUR_OF_DAY);
        int minutos = calendario.get(Calendar.MINUTE);
        String time = String.valueOf(hora) + ":" + String.valueOf(minutos) + ":00";
        return time;
    }

    public boolean validateIsInTime(TypeTurn typeTurn) {
        boolean isInTime = false;
        String initTime = typeTurn.getInitHour();
        String finalTime = typeTurn.getFinalHour();
        String nowTime = getTime();
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        Date dateInit = null;
        Date dateFinal = null;
        Date dateNow = null;
        try {
            dateInit = formatter.parse(initTime);
            dateFinal = formatter.parse(finalTime);
            dateNow = formatter.parse(nowTime);
        } catch (Exception e) {

        }
        if (dateInit.before(dateNow)) {
            if (dateFinal.after(dateNow)) {
                isInTime = true;
            }
        }
//        System.out.println(dateInit);
//        System.out.println(dateFinal);
//        System.out.println(dateNow);
//        System.out.println("init: " + initTime);
//        System.out.println("final: " + finalTime);
//        System.out.println("now: " + nowTime);
//        System.out.println(isInTime);
        return isInTime;
    }
}
