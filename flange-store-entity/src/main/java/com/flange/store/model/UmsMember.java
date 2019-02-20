package com.flange.store.model;

import java.io.Serializable;
import java.util.Date;

public class UmsMember implements Serializable {
    private String id;

    /**
     * 用户名
     *
     * @mbggenerated
     */
    private String userName;

    /**
     * 用户密码
     *
     * @mbggenerated
     */
    private String userPassword;

    /**
     * 用户昵称
     *
     * @mbggenerated
     */
    private String nickname;

    /**
     * 手机号码
     *
     * @mbggenerated
     */
    private String phone;

    /**
     * 性别：0->未知；1->男；2->女
     *
     * @mbggenerated
     */
    private Integer gender;

    /**
     * 职业
     *
     * @mbggenerated
     */
    private String job;

    /**
     * 所在城市
     *
     * @mbggenerated
     */
    private String city;

    /**
     * 邮箱
     *
     * @mbggenerated
     */
    private String email;

    /**
     * 头像
     *
     * @mbggenerated
     */
    private String icon;

    /**
     * 出生日期
     *
     * @mbggenerated
     */
    private Date birthday;

    /**
     * 注册时间
     *
     * @mbggenerated
     */
    private Date createTime;

    /**
     * 账户状态:0->禁用;1->启用
     *
     * @mbggenerated
     */
    private Integer status;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userName=").append(userName);
        sb.append(", userPassword=").append(userPassword);
        sb.append(", nickname=").append(nickname);
        sb.append(", phone=").append(phone);
        sb.append(", gender=").append(gender);
        sb.append(", job=").append(job);
        sb.append(", city=").append(city);
        sb.append(", email=").append(email);
        sb.append(", icon=").append(icon);
        sb.append(", birthday=").append(birthday);
        sb.append(", createTime=").append(createTime);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}