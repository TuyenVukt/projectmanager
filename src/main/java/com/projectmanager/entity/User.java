package com.projectmanager.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "user")
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "user_name", nullable = false)
    private String userName;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "is_admin", nullable = false)
    private Boolean admin;

    @Column(name = "is_delete", nullable = false)
    private Boolean delete;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "create_date", nullable = false)
    private Date createDate;

    @Column(name = "update_date")
    private Date updateDate;

    @Column(name = "create_user", nullable = false)
    private Integer createUser;

    @OneToMany(mappedBy = "createUser", fetch = FetchType.LAZY)
    private List<Project> projectCreatedList;

//    @OneToMany(mappedBy = "createUser", fetch = FetchType.LAZY)
//    private List<Task> taskCreatedList;

    @OneToMany(mappedBy = "taskManager", fetch = FetchType.LAZY)
    private List<Task> taskManagementList;

    @OneToMany(mappedBy = "assignedUser", fetch = FetchType.LAZY)
    private List<Todo> todoList;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<ProjectEmployee> projectList;
}
