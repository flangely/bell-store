package com.flange.store.portal.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 会员关注的出版社
 * 8:37 PM
 */
@Document
public class MemberBrandAttention {
    @Id
    private String id;
    @Indexed
    private String memberId;
    private String memberNickname;
    private String memberIcon;
    @Indexed
    private String brandId;
    private String brandName;
    private String brandLogo;
    private String brandCity;
    private Integer brandAttentionCount;
    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberNickname() {
        return memberNickname;
    }

    public void setMemberNickname(String memberNickname) {
        this.memberNickname = memberNickname;
    }

    public String getMemberIcon() {
        return memberIcon;
    }

    public void setMemberIcon(String memberIcon) {
        this.memberIcon = memberIcon;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandLogo() {
        return brandLogo;
    }

    public void setBrandLogo(String brandLogo) {
        this.brandLogo = brandLogo;
    }

    public String getBrandCity() {
        return brandCity;
    }

    public void setBrandCity(String brandCity) {
        this.brandCity = brandCity;
    }

    public Integer getBrandAttentionCount() {
        return brandAttentionCount;
    }

    public void setBrandAttentionCount(Integer brandAttentionCount) {
        this.brandAttentionCount = brandAttentionCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
