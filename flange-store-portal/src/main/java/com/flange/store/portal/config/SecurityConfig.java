//package com.flange.store.portal.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//
///**
// * @author flangely
// * @create 2019-04-19
// * <p>
// * 3:53 PM
// */
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//    @Autowired
//    private UmsMemberService memberService;
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//                .antMatchers(HttpMethod.GET, // 允许对于网站静态资源的无授权访问
//                        "/",
//                        "/*.html",
//                        "/favicon.ico",
//                        "/**/*.html",
//                        "/**/*.css",
//                        "/**/*.js",
//                        "/swagger-resources/**",
//                        "/v2/api-docs/**"
//                )
//                .permitAll()
//                .antMatchers(HttpMethod.OPTIONS)//跨域请求会先进行一次options请求
//                .permitAll()
//                .antMatchers(
//                        "/sso/*",//登录注册
//                        "/home/**"//首页接口
//                )
//                .permitAll()
//                .antMatchers("/member/**","/returnApply/**")// 测试时开启
//                .permitAll()
//                .anyRequest()// 除上面外的所有请求全部需要鉴权认证
//                .authenticated()
//                .and()
//                .exceptionHandling()
//                .accessDeniedHandler(new GoAccessDeniedHandler())
//                .authenticationEntryPoint(new GoAuthenticationEntryPoint())
//                .and()
//                .formLogin()
//                .loginPage("/sso/login")
//                .successHandler(new GoAuthenticationSuccessHandler())
//                .failureHandler(new GoAuthenticationFailureHandler())
//                .and()
//                .logout()
//                .logoutUrl("/sso/logout")
//                .logoutSuccessHandler(new GoLogoutSuccessHandler())
//                .invalidateHttpSession(true)
//                .deleteCookies("JSESSIONID")
//                .and()
//                .csrf()
//                .disable();//开启basic认证登录后可以调用需要认证的接口
//    }
//}
