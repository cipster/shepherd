package projectManager.filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.IOException;

/**
 * Created by ciprian.bostan on 2/19/2015.
 */
public class HttpHeadFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        if (isHttpHead(httpServletRequest)) {
            chain.doFilter(new ForceGetRequestWrapper(httpServletRequest), response);
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
    }

    private boolean isHttpHead(HttpServletRequest request) {
        return "HEAD".equals(request.getMethod());
    }

    private class ForceGetRequestWrapper extends HttpServletRequestWrapper {
        public ForceGetRequestWrapper(HttpServletRequest request) {
            super(request);
        }

        public String getMethod() {
            return "GET";
        }
    }
}