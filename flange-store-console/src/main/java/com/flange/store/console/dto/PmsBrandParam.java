package com.flange.store.console.dto;

import com.flange.store.console.validator.FlagValidator;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Min;

/**
 * 出版社传递参数
 * Created by flangely on 2018/4/26.
 */
public class PmsBrandParam {
    @ApiModelProperty(value = "出版社名称",required = true)
    @NotEmpty(message = "名称不能为空")
    private String name;
    @ApiModelProperty(value = "出版社首字母")
    private String firstLetter;
    @ApiModelProperty(value = "排序字段")
    @Min(value = 0, message = "排序最小为0")
    private Integer sort;
    @ApiModelProperty(value = "是否为厂家制造商")
    @FlagValidator(value = {"0","1"}, message = "厂家状态不正确")
    private Integer factoryStatus;
    @ApiModelProperty(value = "是否进行显示")
    @FlagValidator(value = {"0","1"}, message = "显示状态不正确")
    private Integer showStatus;
    @ApiModelProperty(value = "出版社logo",required = true)
    @NotEmpty(message = "出版社logo不能为空")
    private String logo;
    @ApiModelProperty(value = "出版社大图")
    private String bigPic;
    @ApiModelProperty(value = "出版社故事")
    private String brandStory;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirstLetter() {
        return firstLetter;
    }

    public void setFirstLetter(String firstLetter) {
        this.firstLetter = firstLetter;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getFactoryStatus() {
        return factoryStatus;
    }

    public void setFactoryStatus(Integer factoryStatus) {
        this.factoryStatus = factoryStatus;
    }

    public Integer getShowStatus() {
        return showStatus;
    }

    public void setShowStatus(Integer showStatus) {
        this.showStatus = showStatus;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getBigPic() {
        return bigPic;
    }

    public void setBigPic(String bigPic) {
        this.bigPic = bigPic;
    }

    public String getBrandStory() {
        return brandStory;
    }

    public void setBrandStory(String brandStory) {
        this.brandStory = brandStory;
    }
}
