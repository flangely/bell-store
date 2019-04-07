package com.flange.store.console.controller;

import com.flange.store.console.dto.CommonResult;
import com.flange.store.console.service.SFTPService;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author flangely
 * @create 2019-03-23
 * <p> 图片管理接口
 * 6:52 PM
 */
@Controller
@RequestMapping("/image")
public class SFTPController {

    private static Logger LOG = LoggerFactory.getLogger(SFTPController.class);

    @Autowired
    private SFTPService sftpService;

    @ApiOperation("图片上传")
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Object uploadImg(@RequestParam(value = "file") MultipartFile file){

        try {
            String imgUrl = sftpService.saveFile(file);
            return new CommonResult().success(imgUrl);
        }catch (Exception e){
            LOG.error(e.getMessage());
            return new CommonResult().failed();
        }
    }

    @ApiOperation("删除图片")
    @RequestMapping(value = "/delete/{name}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteImg(@PathVariable String name){
        try {
            int count = sftpService.delFile(name);
            return new CommonResult().success(count);

        }catch (Exception e){
            LOG.error(e.getMessage());
            return new CommonResult().failed();
        }

    }

}
