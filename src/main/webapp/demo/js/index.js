new Vue({
    el: '#myContainer',
    data: {
        resultFlag: false,
        subFlag: 0,
        mainFlag: 0,
        selected: 1,
        expand: 0
    },
    mounted() {
    	// 百度地图API功能
    	var map = new BMap.Map("allmap",{enableMapClick:false});    // 创建Map实例
    	map.centerAndZoom(new BMap.Point(121.47, 31.23), 12);  // 初始化地图,设置中心点坐标和地图级别
    	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    	map.addControl(new BMap.NavigationControl({enableGeolocation:true}));
    	map.addControl(new BMap.OverviewMapControl());
    	map.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
    	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    	//===================
    	var xy = [
    		{'x':121.48123,'y':31.23123},
    		{'x':121.4723,'y':31.25123},
    		{'x':121.48223,'y':31.33123},
    		{'x':121.46623,'y':31.35123},
    		{'x':121.23123,'y':31.36123},
    		{'x':121.25123,'y':31.22123},
    		{'x':121.36123,'y':31.28123},
    		{'x':121.45123,'y':31.12123},
    		{'x':121.5623,'y':31.8123},
    		{'x':121.45623,'y':31.73123},
    		{'x':121.38123,'y':31.63123}
    	];
    	var markers = [];
    	var pt = null;
    	for (var i in xy) {
    	   pt = new BMap.Point(xy[i].x , xy[i].y);
    	   var marker = new BMap.Marker(pt);
    	   markers.push(marker);
    	}
    	//最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
    	var markerClusterer = new BMapLib.MarkerClusterer(map,
    		{
    			markers:markers,
    			girdSize : 100,
    			styles : [{
    	            url:'./img/blue.png',
    	            size: new BMap.Size(92, 92),
    				backgroundColor : '#E64B4E'
    			}],
    		});
    	markerClusterer.setMaxZoom(13);
    	markerClusterer.setGridSize(100);
    //================================================
    	var xy1 = [	{'x':118.85952,'y':32.0711},
    		{'x':118.651976,'y':32.047353},
    		{'x':118.735051,'y':32.059839},
    		{'x':118.777882,'y':32.054019},
    		{'x':118.677882,'y':32.059839},
    		{'x':118.787882,'y':32.079839},
    		{'x':118.777982,'y':32.069839}];
    	var markers1 = [];
    	var pt = null;
    	for (var i in xy1) {
    	   pt = new BMap.Point(xy1[i].x , xy1[i].y);
    	   var marker = new BMap.Marker(pt);
    	   markers1.push(marker);
    	}
    	//最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
    	var markerClusterer1 = new BMapLib.MarkerClusterer(map,
    		{
    			markers:markers1,
    			girdSize : 100,
    			styles : [{
    	            url:'./img/red.png',
    	            size: new BMap.Size(92, 92),
    				backgroundColor : '#4783E7'
    			}],
    		});
    	markerClusterer1.setMaxZoom(13);
    	markerClusterer1.setGridSize(100);
    },
    methods: {
        out: function (current) {
            setTimeout(() => {
                if (this.mainFlag == 1) {
                    this.subFlag = 0;
                    this.mainFlag = 0;
                    this.expand = 0;
                }
            }, 300);
        },
        over: function (current) {
            this.selected = 1;
            this.mainFlag = 1;
            this.subFlag = current;
            this.expand = current;
        },
        subOver: function (current) {
            this.mainFlag = 0;
            this.subFlag = current;
        },
        subOut: function (current) {
            this.subFlag = 0;
            this.expand = 0;
        },
        cbSelect: function(e) {
            var that = $(e.target).parent('.condition-item');
            if(that.hasClass('selected')){
                that.removeClass('selected');
            }else{
                that.addClass('selected');
            }
        },
        smcbSelect: function(e) {
            var that = $(e.target).parent('li');
            if(that.hasClass('selected')){
                that.removeClass('selected');
            }else{
                that.addClass('selected');
            }
        },
        expander: function(){
            if ($('.expander').hasClass("fadeIn")) {
                $('.content').css("width", "73%");
                $('.expander').css("right", "26.2%");
                $('.expander').css("background",
                    "url('img/map-expander.png') 100% 0% no-repeat");
                $('.expander').removeClass("fadeIn");
                $('.expander').addClass("fadeOut");
            } else {
                $('.content').css("width", "100%");
                $('.expander').css("right", "0");
                $('.expander').css("background",
                    "url('img/map-expander.png') 35% 0% no-repeat");
                $('.expander').removeClass("fadeOut");
                $('.expander').addClass("fadeIn");
            }
        },
        showDetail: function(){
            layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                area: ['40rem', '30rem'],
                shadeClose: true,
                scrollbar: false, 
                content: $('.detail')
            });
        }
    }
})

function attribute(marker){
//	console.log(marker);
	var p = marker.getPosition();  //获取marker的位置
	console.log("marker的位置是" + p.lng + "," + p.lat);    
}