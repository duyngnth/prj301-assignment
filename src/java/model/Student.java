/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author duyng
 */
public class Student {
    String id;
    String memberCode;
    String surname;
    String middleName;
    String givenName;
    ArrayList<Group> groups = new ArrayList<>();

    public Student() {
    }

    public Student(String id, String memberCode, String surname, String middleName, String givenName) {
        this.id = id;
        this.memberCode = memberCode;
        this.surname = surname;
        this.middleName = middleName;
        this.givenName = givenName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMemberCode() {
        return memberCode;
    }

    public void setMemberCode(String memberCode) {
        this.memberCode = memberCode;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public ArrayList<Group> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<Group> groups) {
        this.groups = groups;
    }
    
    @Override
    public String toString() {
        return id + " - " + memberCode + " - " + surname + " " + middleName + " " + givenName;
    } 
}
