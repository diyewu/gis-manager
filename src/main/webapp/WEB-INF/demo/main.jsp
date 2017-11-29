<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=plEzfOG4jm58EGxEsHw4kCPoG3UjOcNv"></script>
    <script src="plugins/layer/layer.js"></script>
    <script src="js/common.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="plugins/earthmap/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="plugins/earthmap/css/layerown.css" />
    <script type="text/javascript" src="plugins/earthmap/js/layerown.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/earthmap/css/component.css" />
	<link rel="stylesheet" type="text/css" href="css/loader.css">
    <script type="text/javascript">         
    // 等待所有加载
    //$(window).load(function(){
    $(document).ready(function() { 
    	$('#myContainer').hide();
        $('body').addClass('loaded');
        $('#loader-wrapper .load_title').remove();
    }); 
</script>
</head>

<body style="overflow:hidden;" class="demo-1">

	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
		<div class="load_title">
			拼命加载中<br>
			<span>请稍后</span>
		</div>
	</div>
	<!--页面加载end-->
    <div id="container"  class="container intro-effect-push">
        <header class="header" style="z-index:10;top:0;left:0;">
            <div class="video-class" id="playearthmap">
                <video autoplay muted style="width:100%" onended="endPlay();" ;>
                    <source src="img/dfmz.mp4" type="video/mp4">
                </video>
            </div>
        </header>
        <button class="trigger" data-info="跳过"><span>跳过</span></button>
        <div class="myContainer" id="myContainer">
            <div class="myHeader" id="myHeader">
                <a href="/" class="logo"></a>
                <input type="text" placeholder="请输入名称" class="search-input" @click="resultFlag = !resultFlag">
                <a class="search-btn"><i class="fa fa-search" aria-hidden="true"></i></a>
                <div class="result-list" style="display: none;">
                    <ul>

                    </ul>
                </div>
                <div class="result-list" v-show="resultFlag" style="display:none;">
                    <ul>
                        <li class="hot-title">热门搜索</li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                        <li>
                            <span class="name-span">测试测试测试测试测试</span>
                        </li>
                    </ul>
                </div>
                <div class="region-box" @mouseenter="over('region')" @mouseleave="out('region')">
                    <a href="javascript:;" id="regionTab" class="region" :class="{'expand':expand=='region'}" @click="">
                                        <span>区域/地铁</span>
                                        <i class="fa fa-sort-desc" aria-hidden="true"></i>                        
                                    </a>
                </div>
                <div class="region-list slide-transition sh" style="display: none;" v-show="subFlag == 'region'" @mouseenter="subOver('region')"
                    @mouseleave="subOut('region')">
                    <ul class="first-info-list">
                        <li :class="{ 'selected': selected == 1 }" @mouseenter="selected = 1">不限</li>
                        <li :class="{ 'selected': selected == 2 }" @mouseenter="selected = 2">区域</li>
                        <li :class="{ 'selected': selected == 3 }" @mouseenter="selected = 3">地铁</li>
                    </ul>
                    <ul class="second-info-list data-list swing-transition" style="display: none;" v-show="selected == 3">
                        <li>全部</li>
                        <li data-dianji="区域/地铁/1号线">1号线</li>
                        <li data-dianji="区域/地铁/2号线">2号线</li>
                        <li data-dianji="区域/地铁/3号线">3号线</li>
                        <li data-dianji="区域/地铁/4号线">4号线</li>
                        <li data-dianji="区域/地铁/5号线">5号线</li>
                        <li data-dianji="区域/地铁/6号线">6号线</li>
                        <li data-dianji="区域/地铁/7号线">7号线</li>
                        <li data-dianji="区域/地铁/8号线">8号线</li>
                        <li data-dianji="区域/地铁/9号线">9号线</li>
                        <li data-dianji="区域/地铁/10号线">10号线</li>
                        <li data-dianji="区域/地铁/11号线">11号线</li>
                        <li data-dianji="区域/地铁/12号线">12号线</li>
                        <li data-dianji="区域/地铁/13号线">13号线</li>
                        <li data-dianji="区域/地铁/16号线">16号线</li>
                    </ul>
                    <ul class="third-info-list data-list swing-transition" style="display: none;" v-show="selected == 2">
                        <li>全部</li>
                        <li data-dianji="bizcircle/华新">黄浦区</li>
                        <li data-dianji="bizcircle/香花桥">徐汇区</li>
                        <li data-dianji="bizcircle/徐泾">长宁区</li>
                        <li data-dianji="bizcircle/夏阳">杨浦区</li>
                        <li data-dianji="bizcircle/盈浦">虹口区</li>
                        <li data-dianji="bizcircle/重固">普陀区 </li>
                        <li data-dianji="bizcircle/朱家角">浦东新区 </li>
                        <li data-dianji="bizcircle/赵巷">宝山区</li>
                        <li data-dianji="bizcircle/赵巷">嘉定区</li>
                        <li data-dianji="bizcircle/赵巷">闵行区</li>
                        <li data-dianji="bizcircle/赵巷">松江区</li>
                        <li data-dianji="bizcircle/赵巷">青浦区</li>
                        <li data-dianji="bizcircle/赵巷">奉贤区</li>
                        <li data-dianji="bizcircle/赵巷">金山区</li>
                    </ul>
                </div>
                <div class="filter-box">
                    <a href="javascript:;" class="filter price" :class="{'expand':expand=='price'}" @mouseenter="over('price')" @mouseleave="out('price')">
                                        <span>属性</span>
                                        <i class="fa fa-sort-desc" aria-hidden="true"></i>                        
                                    </a>
                </div>
                <div class="info-list price slide-transition" style="display: none;" v-show="subFlag=='price'" @mouseenter="subOver('price')"
                    @mouseleave="subOut('price')">
                    <ul>
                        <li>所有</li>
                        <li data-dianji="price/100万以下">
                            <span class="text">市容 </span>

                        </li>
                        <li data-dianji="price/100-200万">
                        <span class="text"> 绿化 </span></li>
                        <li data-dianji="price/200-300万">
                        <span class="text"> 环卫 </span></li>
						<li data-dianji="price/300-400万">
						<span class="text">小区 </span></li>
						<li data-dianji="price/400-500万"><span class="text">
								城管 </span></li>
					</ul>
                </div>
                <!-- 
                <div class="filter-box">
                    <a href="javascript:;" class="filter room" :class="{'expand':expand=='room'}" @mouseenter="over('room')" @mouseleave="out('room')">
                                        <span>测试</span>
                                        <i class="fa fa-sort-desc" aria-hidden="true"></i>                        
                                    </a>
                </div>
                <div class="info-list room slide-transition" style="display: none;" v-show="subFlag=='room'" @mouseenter="subOver('room')"
                    @mouseleave="subOut('room')">
                    <ul>
                        <li>不限</li>
                        <li data-dianji="room/一室" @click="smcbSelect($event)">
                            <span class="text">
                                                一室
                                            </span>
                            <div class="checkbox checkbox-sm">
                                <span class="check"></span>
                            </div>
                        </li>
                        <li data-dianji="room/二室" @click="smcbSelect($event)">
                            <span class="text">
                                                二室
                                            </span>
                            <div class="checkbox checkbox-sm">
                                <span class="check"></span>
                            </div>
                        </li>
                        <li data-dianji="room/三室" @click="smcbSelect($event)">
                            <span class="text">
                                                三室
                                            </span>
                            <div class="checkbox checkbox-sm">
                                <span class="check"></span>
                            </div>
                        </li>
                        <li data-dianji="room/四室" @click="smcbSelect($event)">
                            <span class="text">
                                                四室
                                            </span>
                            <div class="checkbox checkbox-sm">
                                <span class="check"></span>
                            </div>
                        </li>
                        <li data-dianji="room/五室" @click="smcbSelect($event)">
                            <span class="text">
                                                五室
                                            </span>
                            <div class="checkbox checkbox-sm">
                                <span class="check"></span>
                            </div>
                        </li>
                        <li data-dianji="room/五室以上" @click="smcbSelect($event)">
                            <span class="text">
                                                五室以上
                                            </span>
                            <div class="checkbox checkbox-sm">
                                <span class="check"></span>
                            </div>
                        </li>
                    </ul>
                </div>
                 -->
                <div class="more-box" @mouseenter="over('more')" @mouseleave="out('more')">
                    <a href="javascript:;" class="filter more " :class="{'expand':expand=='more'}">
                                        <span>更多</span>
                                        <i class="fa fa-sort-desc" aria-hidden="true"></i>                        
                                    </a>
                </div>
                <div class="condition-box slide-transition" style="display:none;" v-show="subFlag=='more'" @mouseenter="subOver('more')"
                    @mouseleave="subOut('more')">
                    <div class="condition-row">
                        <div class="condition-title">
                            <span>测试测试</span>

                        </div>
                        <div class="condition-colon">：</div>
                        <div class="condition-body">
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                        </div>
                    </div>
                    <div class="condition-row">
                        <div class="condition-title">
                            <span>测试测试</span>

                        </div>
                        <div class="condition-colon">：</div>
                        <div class="condition-body">
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">测试</span>
                            </div>
                        </div>
                    </div>

					<!-- 
                    <div class="condition-row">
                        <div class="condition-title">
                            <span>环</span>
                            <span>线</span>
                        </div>
                        <div class="condition-colon">：</div>
                        <div class="condition-body">
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">内环内</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">内中环</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">中外环</span>
                            </div>
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">外环外</span>
                            </div>
                        </div>
                    </div>

                    <div class="condition-row">
                        <div class="condition-title">
                            <span>特</span>
                            <span>色</span>

                        </div>
                        <div class="condition-colon">：</div>
                        <div class="condition-body">
                            <div class="condition-item" @click="cbSelect($event)">
                                <div class="checkbox checkbox-lg">
                                    <span class="check"></span>
                                </div>
                                <span class="condition-txt">独栋</span>
                            </div>
                        </div>
                    </div>
                     -->
                </div>
                <div class="login-register">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <div class="typeUserInfo">
                        <div class="no-login">
                            <a class="login login-user-btn btn-login ">登录</a> |
                            <a href="" target="_blank"
                                class="register">注册</a>
                        </div>
                        <div class="logged" style="display: none;">
                            <a class="user-name" href=""></a>
                            <a href="" class="">退出</a>
                        </div>
                    </div>
                </div>
                <a class="go-to-list"><i class="fa fa-list-ul" aria-hidden="true"></i>联系我们</a>
            </div>
            <div id="allmap" class="content"></div>
            <div class="expander fadeOut" @click="expander()">
            </div>
            <div class="list-container">
                <div class="overlay" style="display: none;"></div>
                <div class="list-header">
                    <span class="total-count">共<em>666</em>张图片</span>
                    <!-- 
                    <span class="sort" data-dianji="time/排序">开盘时间<i class="fa fa-arrow-down" aria-hidden="true"></i></span>
                    <span class="sort" data-dianji="price/排序">价格<i class="fa fa-arrow-up" aria-hidden="true"></i></span>
                    <span class="sort on" data-dianji="default/排序">默认</span>
                     -->
                </div>
                <div class="item-wrap" style="overflow-x:hidden;overflow-y:auto;">
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="1617">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/lujinsheshanyuanzibs/">楠华饭店</a>
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!-- <span class="sale-status" data-status="在售">正常</span> -->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/测试图片详情"></i>
                            </div>
                            <div><span>负责人：酱油</span> <span class="price">详情</span></div>
                            <div><span>饭店测试</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>
                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="1474">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/xiangyitiandi/">XXXXXX</a>
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注香溢花城"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>
                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="1616">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/lujinsheshanyuanzi/">XXXXXX</a>
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/测试图片详情"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>
                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="349">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/shanghaivillabs/">XXXXXX</a>
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注上海villa"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>饭店测试</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>
                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="1618">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/yuzhoufu/">XXXXXX</a>
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注禹洲府"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>
                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="1253">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/jindishijia/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注金地世家"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="1268">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/biyunyilingbs/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注碧云壹零（饭店）"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>饭店测试</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="73">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/mingtianhuachengerqi/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注XXXXXX"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="127">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/zhengrongguolingbs/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/XXXXXX"></i>
                            </div>
                            <div><span>115-360m²</span> <span class="price">XXXXXX</span></div>
                            <div><span>饭店测试</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="160">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/hongqiaozhengrongfu/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/关注虹桥正荣府"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="390">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/jiabaomengzhiyuanjingting/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/XXXXXX"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                    <div class="list-item" @click="showDetail()" data-dianji="go-to-detail" data-id="768">
                        <img alt="" onerror="this.src='img/mz.jpg';this.onerror=null;" src="img/mz.jpg">
                        <div class="right-info">
                            <div>
                                <span class="title">
                                            <a target="_blank" href="/detail/yuanchangxingfuli/">XXXXXX</a>
                    
                                        </span>
                                <span class="villa-name">饭店</span>
                                <!--<span class="sale-status" data-status="在售">在售</span>-->
                                <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/XXXXXX"></i>
                            </div>
                            <div><span>XXXXXX</span> <span class="price">XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                            <div><span>XXXXXX</span></div>
                        </div>

                        <hr>
                    </div>
                </div>
            </div>
            <div class="detail" style="display:none;overflow:hidden;">
                <div class="imgBox">
                    <img src="img/bigPic.jpeg" style="width:40rem;height:100%;vertical-align:top;">
                </div>
                <div class="houseInfo" style="margin: 0.3rem 0.85rem;">
                    <span class="title" style="font-weight:bolder;font-size:0.9rem;">
                        <a target="_blank" href="/detail/lujinsheshanyuanzibs/">楠华饭店</a>
                    </span>
                    <span class="villa-name">饭店</span><!--<span class="sale-status" data-status="在售">在售</span>-->
                    <i class="iconfont favor-icon" style="display: none;" data-dianji="favor/XXXXXX"></i>
                    <div class="inlineText"><span><span class="tag">测试测试：</span><span>XXXXXX</span></span><span class="afterSpan"><span class="tag">测试介绍：</span><span>饭店测试</span></span>
                    </div>
                    <div class="inlineText"><span><span class="tag">测试测试：</span><span class="price">XXXXXX</span></span><span class="afterSpan"><span class="tag">地址：</span><span>松江-松江松江崇南公路599弄</span></span>
                    </div>
                </div>
            </div>
        </div>
</body>
<script src="js/vue.min.js"></script>
<script src="js/index.js"></script>
<script src="plugins/earthmap/js/classie.js"></script>
</html>