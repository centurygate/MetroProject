package com.xigeng.metroproject.controller;

/**
 * Created by free on 16-11-16.
 */


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xigeng.metroproject.log.SystemLog;
import com.xigeng.metroproject.model.*;
import com.xigeng.metroproject.service.*;
import com.xigeng.metroproject.springsecurity.MyJdbcDaoImpl;
import com.xigeng.metroproject.springsecurity.MyPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.regex.Pattern;

@Controller
public class MainController {

    @Autowired
    private IAlarmService alarmService;

/*    @Autowired
    private AlarmManager alarmmgr;*/

    @Autowired
    private ISheetService sheetService;

    @Autowired
    private IMonitorService monitorService;

    @Autowired
    private IAssetService assetService;

    @Autowired
    private ITableService tableService;

    @Autowired
    private IBusinessService businessService;

    @Autowired
    private SecurityUserEntityService securityUserEntityService;

    @Autowired
    private SecurityResourceService securityResourceService;

    @Autowired
    private SimpMessageSendingOperations smso;

    @Autowired
    private ISecurityResourceRoleService securityResourceRoleService;

    @Autowired
    private ISecurityUserRoleService securityUserRoleService;


    @RequestMapping(value = "/service/rest/getAuthByName", method = RequestMethod.GET)
    @ResponseBody
    public Set<Resource> getAuthByName(HttpServletRequest request, HttpServletResponse response, @RequestParam String userid) {
        SystemLog.log("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        SystemLog.log(userid);
        String resourceQuery = " select sr.id, sr.res_string,sr.res_type\n" +
                "from security_resource sr\n" +
                "join security_resource_role srr\n" +
                "on sr.id=srr.resc_id\n" +
                "join security_user_role sur\n" +
                "on sur.role_id=srr.role_id\n" +
                "join security_user su\n" +
                "on su.id = sur.user_id\n" +
                "where sr.bsinglerole = 1 and su.id = ?\n" +
                "order by sr.priority";
        Set<Resource> resourceSet = new HashSet<Resource>();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        DataSource dataSource = (DataSource) ctx.getBean("dataSource");
        ResourceMapping resourceMapping = new ResourceMapping(dataSource, resourceQuery);
        List<Resource> resourceList = resourceMapping.execute(new Object[]{Long.valueOf(userid,10)});
        for (Resource resource :
                resourceList) {
            resourceSet.add(resource);
        }
        SystemLog.log("--------------------Resource List size"+resourceList.size()+"---------------------");
        SystemLog.log(resourceList);
        SystemLog.log("--------------------Resource Set  size"+resourceSet.size()+"---------------------");
        SystemLog.log(resourceSet);
        return resourceSet;
    }

    @RequestMapping(value = "/getcsrf")
    public String innerchauth()
    {
        SystemLog.log("Enter=========================> getscrf");
        return "getcsrf";
    }

    @RequestMapping(value = "/doinnerchanuth", method = RequestMethod.POST)
    @ResponseBody
    public Result doinnerchanuth(@RequestParam String userid, @RequestParam String delauth, @RequestParam String addauth) {
        SystemLog.log("---------------------------------------------------------");
        SystemLog.log("userid:"+userid);
        SystemLog.log("delauth:"+delauth);
        SystemLog.log("addauth:"+addauth);
        if (!delauth.equals("none"))
        {
            String [] delauth_array= delauth.split(",");
            for (int i=0;i < delauth_array.length;i++)
            {
                List<SecurityResourceRoleEntity> securityResourceRoleEntityList = securityResourceRoleService.selectAllRoleIdbyResId(Long.valueOf(delauth_array[i]));
                if (securityResourceRoleEntityList.size() >1)
                {
                    SystemLog.log("Found Greater than 1");
                    Result result = new Result(0,"Error");
                    return result;
                }
                securityUserRoleService.deleteByPrimaryKey(new SecurityUserRoleEntity(Long.valueOf(userid,10),Long.valueOf(securityResourceRoleEntityList.get(0).getRoleId().intValue())));
            }
        }
        if (!addauth.equals("none"))
        {
            String [] addauth_array= addauth.split(",");
            for (int i=0;i < addauth_array.length;i++)
            {
                List<SecurityResourceRoleEntity> securityResourceRoleEntityList = securityResourceRoleService.selectAllRoleIdbyResId(Long.valueOf(addauth_array[i]));
                if (securityResourceRoleEntityList.size() >1)
                {
                    SystemLog.log("Found Greater than 1");
                    Result result = new Result(0,"Error");
                    return result;
                }
                securityUserRoleService.insert(new SecurityUserRoleEntity(Long.valueOf(userid,10),Long.valueOf(securityResourceRoleEntityList.get(0).getRoleId().intValue())));
            }
        }

        Result result = new Result(1,"ok");
        return result;
    }

    @RequestMapping(value = "/changepasswordaction", method = RequestMethod.POST)
    public String changepasswordaction(HttpServletRequest request, HttpServletResponse response, @RequestParam String originPassword, @RequestParam String newPassword, @RequestParam String confirmPassword) throws Exception {
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        MyPasswordEncoder myPasswordEncoder = (MyPasswordEncoder) ctx.getBean("passwordEncoder");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        SecurityUserEntity securityUserEntity = securityUserEntityService.selectByUserName(userDetails.getUsername());
        SystemLog.log("originPassword: " + originPassword);
        SystemLog.log("newPassword: " + newPassword);
        SystemLog.log("confirmPassword: " + confirmPassword);

        if (myPasswordEncoder.encodePassword(originPassword.trim(), userDetails.getUsername()).equals(userDetails.getPassword())) {
            SystemLog.log("OriginPassword is Right");
        }

        if (newPassword.trim().equals(confirmPassword.trim())) {
            SystemLog.log("originPassword.trim().equals(confirmPassword.trim())");

            String encryptPassword = myPasswordEncoder.encodePassword(newPassword, userDetails.getUsername());

            securityUserEntity.setPassword(encryptPassword);
            securityUserEntityService.updateByPrimaryKey(securityUserEntity);
        }
        MyJdbcDaoImpl myJdbcDao = (MyJdbcDaoImpl) ctx.getBean("userDetailsService");
        myJdbcDao.loadUserByUsername(userDetails.getUsername());

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?changepwd=Change Password Successfully";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        SystemLog.log("Enter /login");
        return "login";
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome() {
//		businessService.SecurityMethodTest();
        return "tiles-home.page";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
    }


    //////////////////////////////////////////////////////////////////////////////////////////////////


    /*jsp页面跳转*/
    @RequestMapping(value = "goindex")
    public String goindex() throws Exception {

        return "tiles-home.page";
    }


    @RequestMapping(value = "godimension")
    public String godimension() throws Exception{

        return "tiles-3dimension.page";
    }


    @RequestMapping(value = "gomonitor")
    public String gomonitor() throws Exception {

        return "tiles-monitor.page";
    }


    @RequestMapping(value = "gochart")
    public String gochart() throws Exception {

        return "tiles-chart.page";
    }


    @RequestMapping(value = "gosheet")
    public String gosheet() throws Exception {

        return "tiles-sheet.page";
    }


    @RequestMapping(value = "goanalysis")
    public String goanalysis() throws Exception {

        return "tiles-analysis.page";
    }


    @RequestMapping(value = "gopassword", method = RequestMethod.GET)
    public String gopassword() {

        return "tiles-password.page";
    }


    @RequestMapping(value = "goauthority", method = RequestMethod.GET)
    public String goauthority(Model model) {

        model.addAttribute("securityUserEntityList", securityUserEntityService.selectAllSecurityUserEntity());
        model.addAttribute("securityResourceEntityList", securityResourceService.selectAllSecurityResource());
        return "tiles-authority.page";
    }


/*    @RequestMapping(value = "gouser")
    public String gouser() throws Exception {

        return "UserManager";
    }*/


    //Ajax请求获取‘总览报表1’数据
    @RequestMapping(value = "sheet1")
    public ModelAndView dosheet1(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable1();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表2’数据
    @RequestMapping(value = "sheet2")
    public ModelAndView dosheet2(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable2();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表3’数据
    @RequestMapping(value = "sheet3")
    public ModelAndView dosheet3(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable3();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表4’数据
    @RequestMapping(value = "sheet4")
    public ModelAndView dosheet4(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable4();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表5’数据
    @RequestMapping(value = "sheet5")
    public ModelAndView dosheet5(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable5();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表6’数据
    @RequestMapping(value = "sheet6")
    public ModelAndView dosheet6(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable6();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表7’数据
    @RequestMapping(value = "sheet7")
    public ModelAndView dosheet7(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable7();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表8’数据
    @RequestMapping(value = "sheet8")
    public ModelAndView dosheet8(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable8();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表9’数据
    @RequestMapping(value = "sheet9")
    public ModelAndView dosheet9(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable9();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    //Ajax请求获取‘总览报表10’数据
    @RequestMapping(value = "sheet10")
    public ModelAndView dosheet10(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Table> tables = this.tableService.selectTable10();
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(tables);
        out.println(writedata);

        return null;
    }


    /////////////////////////ASSET-设备管理模块//////////////////////////////////////////////////////////

    @RequestMapping(value = "asset")
    public ModelAndView doasset(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Asset> assets = this.assetService.selectAssetByType(0);
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        String writedata = mapper.writeValueAsString(assets);
        out.println(writedata);

        return null;
    }



    ////////////////////////////REALTIME VALUE--实时数据接收/////////////////////////////////////////////


    @RequestMapping(value="/service/rest/putdata", method = RequestMethod.GET)
    @ResponseBody
    public Result putdata(@RequestParam String value)
    {
        SystemLog.log("Enter /service/rest/putdata");
        businessService.SecurityMethodTest();

        SystemLog.log("Convert from string  to Object List, just as blow------------------>");


        //推送消息1：measureInfo消息
        ObjectMapper mapper = new ObjectMapper();
        Measure measure = null;

        try {
            measure = mapper.readValue(value, Measure.class);
        }
        catch (IOException e){
            e.printStackTrace();
        }

        Double val =  Double.parseDouble(String.format("%.2f",measure.getValue()));

        MeasureInfo measureInfo = null;
        measureInfo =new MeasureInfo(new Long(Calendar.getInstance().getTime().getTime()), val);

        smso.convertAndSend("/topic/showResult", measureInfo);

        return new Result(Integer.valueOf(1),"success");
    }



    ////////////////////////////ALARM-警报报警模块/////////////////////////////////////////////


    //获取当前数据库中警报条目的数量
    @RequestMapping(value = "serveralarmdata")
    public ModelAndView handleAlarmRequest(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        //利用bean获取数据库的工单项
        List<AlarmItem> items = this.alarmService.selectAllItemList();

        PrintWriter out = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String str_items = mapper.writeValueAsString(items);
        out.println(str_items);

        return null;
    }


    @RequestMapping(value = "doalarmdelete")
    public String doalarmdelete(@RequestParam String name) {

        //删除选中的条目
        alarmService.deleteItem(name);

        return "AlarmManager";
    }


    ////////////////////////////SHEET-工单管理模块/////////////////////////////////////////////

    @RequestMapping(value = "serversheetdata")
    public ModelAndView handleRequest(HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        //利用bean获取数据库的工单项
        List<SheetItem> items = this.sheetService.selectAllItemList();

        PrintWriter out = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        String str_items = mapper.writeValueAsString(items);
        out.println(str_items);

        return null;
    }


    @RequestMapping(value = "doaddsheet")
    public String doaddsheet(@RequestParam String sheetname, @RequestParam String department, @RequestParam String assetname, @RequestParam String starttime,
                             @RequestParam String runstate) {

        //测试插入一条item
        SheetItem textitem = new SheetItem(sheetname, department, assetname, starttime, runstate);
        sheetService.addSheetItem(textitem);

        return "SheetManager";
    }


    @RequestMapping(value = "dosheetdelete")
    public String dosheetdelete(@RequestParam String name) {

        //删除选中的条目
        sheetService.deleteItem(name);

        return "SheetManager";
    }


    @RequestMapping(value = "dosheetedit")
    public String dosheetedit(@RequestParam String sheetname, @RequestParam String department, @RequestParam String assetname, @RequestParam String starttime, @RequestParam String runstate) {

        SheetItem textitem = new SheetItem(sheetname, department, assetname, starttime, runstate);
        sheetService.updateItem(textitem);

        return "SheetManager";
    }


    /* 对应前端注册用户名中signupusername用户名在数据库中是否已经存在
    * $("#signupform").validate({
                    rules: {
                        phone: {checkMobile: true},
                        signupusername: {
                            english: true,
                            remote:{
                                type:"GET",
                                url:"checkUser",
                                data:{
                                    signupusername: function () {
                                        return $("#signupusername").val();
                                    }
                                }
                            }},
                    },
                messages:{
                    signupusername:{remote:$.validator.format("该用户名已被注册")},
                },
                    errorPlacement: function (error, element) {
                        // console.log(element);
                        // console.log(error);
                        error.insertAfter(element.parent());
                    }
                }
            );
    * */
    @RequestMapping(value = "/checkUser",method=RequestMethod.GET)
    public ModelAndView checkUser(@RequestParam String signupusername,HttpServletResponse response) throws IOException {
        SystemLog.log("=====================================================");
        SystemLog.log(signupusername);
        SystemLog.log("=====================================================");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if ((securityUserEntityService.selectByUserName(signupusername)) != null)
        {
            out.println(false);
        }
        else
        {
            out.print(true);
        }
        return null;
    }

    class RegisterStatus
    {
        Integer status;
        String  desc;

        public RegisterStatus() {
        }

        public RegisterStatus(Integer status, String desc) {
            this.status = status;
            this.desc = desc;
        }

        public Integer getStatus() {
            return status;
        }

        public void setStatus(Integer status) {
            this.status = status;
        }

        public String getDesc() {
            return desc;
        }

        public void setDesc(String desc) {
            this.desc = desc;
        }
    }

    //
    class BootStrapTableData {
        Integer total;
        List<BootstrapUserInfo> rows;

        public BootStrapTableData(Integer total, List<SecurityUserEntity> rows) {
            this.total = total;
            this.rows = new ArrayList<BootstrapUserInfo>();
            for (SecurityUserEntity securityUserEntity :
                    rows) {
                this.rows.add(new BootstrapUserInfo(securityUserEntity));
            }
        }

        public Integer getTotal() {
            return total;
        }

        public void setTotal(Integer total) {
            this.total = total;
        }

        public List<BootstrapUserInfo> getRows() {
            return rows;
        }

        public void setRows(List<BootstrapUserInfo> rows) {
            this.rows = rows;
        }
    }

    class BootstrapUserInfo
    {
        public BootstrapUserInfo(SecurityUserEntity securityUserEntity) {
            this.username = securityUserEntity.getUsername();
            this.id = securityUserEntity.getId();
            this.status = securityUserEntity.getStatus();
            this.email = securityUserEntity.getEmail();
            this.phone = securityUserEntity.getPhone();
            this.address = securityUserEntity.getAddress();
            this.date = securityUserEntity.getDate();
        }

        private Long id;

        private String username;

        private Integer status;

        private String email;

        private String phone;

        private String address;

        private Date date;

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public Integer getStatus() {
            return status;
        }

        public void setStatus(Integer status) {
            this.status = status;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public Date getDate() {
            return date;
        }

        public void setDate(Date date) {
            this.date = date;
        }
    }
    @RequestMapping(value = "/getregusers", method = RequestMethod.GET)
    @ResponseBody
    public BootStrapTableData getRegisterUsers(@RequestParam String startDate, @RequestParam String endDate, @RequestParam Integer offset, @RequestParam Integer limit,@RequestParam String search) {
        SystemLog.log("============================================================================");
        SystemLog.log("startDate : "+startDate);
        SystemLog.log("endDate : "+endDate);
        SystemLog.log("offset : "+offset);
        SystemLog.log("limit : "+limit);


        if (startDate.equals("NaN"))
        {
            startDate = ""+(new Date()).getTime();
        }
        if (endDate.equals("NaN"))
        {
            endDate = ""+(new Date()).getTime();
        }
        if ((search.length() ==0) || search.equals("undefined"))
        {
            search = "_%";
        }
        else
        {
            search += "%";
        }
        SystemLog.log("search : "+search);
        int total = securityUserEntityService.selectSecurityUserEntityByCondition(search,new Date(Long.valueOf(startDate)),new Date(Long.valueOf(endDate)));
        List<SecurityUserEntity> userEntitieslst = securityUserEntityService.selectSecurityUserEntityByPageAndLimitAndCondition(search,new Date(Long.valueOf(startDate)),new Date(Long.valueOf(endDate)),offset,limit);
        SystemLog.log(userEntitieslst);
        SystemLog.log("============================================================================");
        return new BootStrapTableData(total,userEntitieslst);
    }

    @RequestMapping(value = "/chguserstatus",method = RequestMethod.GET)
    @ResponseBody
    public String ChangeUserStatus(@RequestParam Long id,@RequestParam Integer status)
    {
        SystemLog.log("id = "+id+"  status = "+status);
        SecurityUserEntity securityUserEntity = securityUserEntityService.selectByPrimaryKey(id);
        SystemLog.log(securityUserEntity);
        securityUserEntity.setStatus(status);
        securityUserEntityService.updateByPrimaryKey(securityUserEntity);
        return "absolutely ok";
    }
    @RequestMapping(value = "/registerUser",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String registerUser(@RequestParam String signupusername,@RequestParam String signuppassword,@RequestParam String confirmpassword,@RequestParam String phone,@RequestParam String email,@RequestParam String address) throws JsonProcessingException
    {
        int count =0;
        ObjectMapper objectMapper = new ObjectMapper();
        RegisterStatus registerStatus = new RegisterStatus();
        StringBuilder stringBuilder = new StringBuilder();
        SystemLog.log("===========================================================");
        SystemLog.log("signupusername:"+signupusername);
        SystemLog.log("signuppassword:"+signuppassword);
        SystemLog.log("confirmpassword:"+confirmpassword);
        SystemLog.log("phone:"+phone);
        SystemLog.log("email:"+email);
        SystemLog.log("===========================================================");
        //参数合法性检测
        if(signupusername.length() < 4 || signupusername.length() > 32)
        {
            stringBuilder.append("usernameError: 用户名长度必须在4-32个字符");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
            return objectMapper.writeValueAsString(registerStatus);
        }
        if(signuppassword.length() < 4 || signuppassword.length() > 32)
        {
            stringBuilder.append("passwordError: 密码长度必须在4-32个字符");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
            return objectMapper.writeValueAsString(registerStatus);
        }
        if(!signuppassword.equals(confirmpassword))
        {
            stringBuilder.append("passwordError: 两次密码必须一致");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
            return objectMapper.writeValueAsString(registerStatus);
        }

        if((Pattern.compile("^1[3|4|5|8][0-9]\\d{8}$").matcher(phone).find() ?false:(Pattern.compile("^0\\d{2,3}-?\\d{7,8}$").matcher(phone).find()?false:true)))
        {
            stringBuilder.append("phoneError:  电话号码格式不正确");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
            return objectMapper.writeValueAsString(registerStatus);
        }

        if (!Pattern.compile("^[a-zA-Z_]{1,}[0-9]{0,}@(([a-zA-z0-9]-*){1,}\\.){1,3}[a-zA-z\\-]{1,}$").matcher(email).find())
        {
            stringBuilder.append("emailError:  邮箱格式不正确");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
            return objectMapper.writeValueAsString(registerStatus);
        }
        if(address.length() < 4 || address.length() > 32)
        {
            stringBuilder.append("addressError: 地址长度必须在4-64个字符");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
            return objectMapper.writeValueAsString(registerStatus);
        }
//        SystemLog.log("=================================================================================");
        SecurityUserEntity searchsecurityUserEntity = securityUserEntityService.selectByUserName(signupusername);
//        SystemLog.log(searchsecurityUserEntity);
//        SystemLog.log("=================================================================================");
        if (searchsecurityUserEntity != null)
        {
//            System.out.println("=================================================================================");
//            System.out.println("usernameError: 用户名已被注册");
            stringBuilder.append("usernameError: 用户名已被注册");
            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc(stringBuilder.toString());
//            System.out.println("=================================================================================");
            return objectMapper.writeValueAsString(registerStatus);
        }


        MyPasswordEncoder myPasswordEncoder = new MyPasswordEncoder();
        SecurityUserEntity securityUserEntity = new SecurityUserEntity();
        securityUserEntity.setUsername(signupusername);
        securityUserEntity.setPassword(myPasswordEncoder.encodePassword(signuppassword,signupusername));
        securityUserEntity.setPhone(phone);
        securityUserEntity.setEmail(email);
        securityUserEntity.setDescfield("New Register User");
        securityUserEntity.setStatus(0);
        securityUserEntity.setAddress(address);
        securityUserEntity.setDate(new Date());
        count = securityUserEntityService.insertSecurityUserEntity(securityUserEntity);
        if(count > 0)
        {
            registerStatus.setStatus(Integer.valueOf(1));
            registerStatus.setDesc("successfully register");
            return objectMapper.writeValueAsString(registerStatus);
        }
        SystemLog.log("autoIncrement Id:"+securityUserEntity.getId());


        /**为新注册用户添加默认的角色*/
        count =
        count = securityUserRoleService.insert(new SecurityUserRoleEntity(securityUserEntity.getId(),Long.valueOf(4l)));

        if(securityUserRoleService.insert(new SecurityUserRoleEntity(securityUserEntity.getId(),Long.valueOf(4l))) == 0
                || securityUserRoleService.insert(new SecurityUserRoleEntity(securityUserEntity.getId(),Long.valueOf(2l)))==0)
        {

            registerStatus.setStatus(Integer.valueOf(0));
            registerStatus.setDesc("databaseError: 数据库权限操作失败!");
        }
        else
        {
            registerStatus.setStatus(Integer.valueOf(1));
            registerStatus.setDesc("注册成功");
        }
        return objectMapper.writeValueAsString(registerStatus);
    }
}