//package handler.member;
//
//import common.command.CommandHandler;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//public class duplicateCheckHandler implements CommandHandler {
//    @Override
//    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//        if (request.getMethod().equalsIgnoreCase("POST")) {
//            return processSubmit(request, response);
//        } else{
//            response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
//            return null;
//        }
//    }
//
//    private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
//        // url 반환 (jsp)
//        request.setAttribute("result", -1);
//    }
//
//}
