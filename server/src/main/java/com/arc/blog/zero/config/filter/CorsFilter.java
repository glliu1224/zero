//package com.arc.blog.zero.config.filter;
//
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Component;
//
//import javax.servlet.*;
//import java.io.IOException;
//
///**
// * @author 叶超
// * @since 2019/3/6 15:58
// */
//@Slf4j
//@Component
//public class CorsFilter implements Filter {
//
//    final static org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(CorsFilter.class);
//
//    @Override
//    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
////        HttpServletResponse response = (HttpServletResponse) res;
////        response.setHeader("Access-Control-Allow-Origin", "*");
////        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
////        response.setHeader("Access-Control-Max-Age", "3600");
////        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
//       log.debug("***********************************************************");
//        log.debug("************************过滤器被调用***********************");
//        log.debug("***********************************************************");
//        chain.doFilter(req, res);
//    }
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    @Override
//    public void destroy() {
//
//    }
//}
