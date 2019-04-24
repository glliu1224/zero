package com.arc.blog.zero.config;


import com.arc.blog.zero.security.core.SecurityUserService;
import com.arc.utils.MD5Utils;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

//import com.arc.zero.security.core.WebAccessDecisionManager;
//import com.arc.zero.security.core.WebFilterInvocationSecurityMetadataSource;
//import com.arc.zero.security.core.WebFilterSecurityInterceptor;

/**
 * 配置类
 *注意：相关 bean 统一注入 才用的是@ Bean 方式注入容器，请勿重复注入
 * @author: 叶超
 * @since: 2019/1/30 15:17
 */
@Slf4j
@Configuration
@EnableWebSecurity
public class ZeroSecurityConfig extends WebSecurityConfigurerAdapter {

    private static final Logger logger = LoggerFactory.getLogger(ZeroSecurityConfig.class);

    @Autowired
//    @Qualifier("securityUserService")
    @Qualifier("securityUserService")
    private UserDetailsService userDetailsService;


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
                .antMatchers("/favicon.ico")
                .antMatchers("/webjars/**")
                .antMatchers("/resource/**")
                .antMatchers("/swagger-ui.html")
                .antMatchers("/swagger-resources/**")
                .antMatchers("/v2/**")
        ;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.headers().frameOptions().sameOrigin();
        http
                //禁用CSRF保护
                .csrf().disable()
                //不拦截资源的url
                .authorizeRequests().antMatchers("/login", "/test/**", "/file/**", "/info").permitAll()
                //需要认证的 	证明是真实的、可靠的或有效
                .anyRequest().authenticated()

                .and().formLogin().loginProcessingUrl("/login/form").defaultSuccessUrl("/success-to-index").permitAll()
//                .and().loginProcessingUrl("/login/form").defaultSuccessUrl("/").permitAll()
//            .loginPage("/login").loginProcessingUrl("/login/form").defaultSuccessUrl("/").permitAll()
                .and()
                .rememberMe()
                //注销行为任意访问
                .and().logout().permitAll();

//        http.addFilterBefore(webFilterSecurityInterceptor(), FilterSecurityInterceptor.class);

    }

    //密码加密
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new PasswordEncoder() {
            @Override
            public String encode(CharSequence rawPassword) {
                return MD5Utils.encrypt16((String) rawPassword);
            }

            @Override
            public boolean matches(CharSequence rawPassword, String encodedPassword) {
                //	解密AES，密码明文转MD5，而后与数据库中的MD5密码mi'wen比对
//                return encodedPassword.equals(MD5Utils.encrypt16((String)  desEncrypt(rawPassword)));
//                return encodedPassword.equals(desEncrypt(rawPassword));
                boolean equals = encodedPassword.equals(desEncrypt(rawPassword));
                log.debug("结果={}", equals);
                log.debug("结果={}", equals);
                log.debug("结果={}", equals);
                return equals;
            }

            //对于前段发来的加密密码（AES）， 解密，
            private String desEncrypt(CharSequence rawPassword) {
                try {
//                    @todo 解密密码
//                    return AESEncryptUtil.desEncrypt((String) rawPassword);
                    return (String) rawPassword;
                } catch (Exception e) {
                    logger.debug("AES  get error when  deciphering password  " + e.toString());
                    return null;
                }
            }
        });
    }


    //================================================
    //                                      相关 bean 统一注入
    //================================================
    //授权决策器
//    @Bean
//    public WebAccessDecisionManager webAccessDecisionManager() {
//        return new WebAccessDecisionManager();
//    }


    //调用服务去查出所有资源信息
//    @Bean
//    public WebFilterInvocationSecurityMetadataSource webFilterInvocationSecurityMetadataSource() {
//        return new WebFilterInvocationSecurityMetadataSource();
//    }

    //权限过滤器
//    @Bean
//    public WebFilterSecurityInterceptor webFilterSecurityInterceptor() {
//        return new WebFilterSecurityInterceptor();
//    }

    @Bean
    public SecurityUserService securityUserService() {
        return new SecurityUserService();
    }
}

