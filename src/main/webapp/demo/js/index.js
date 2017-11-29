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
        var map = new BMap.Map("allmap");
        map.centerAndZoom(new BMap.Point(121.47, 31.23), 11);
        map.addControl(new BMap.MapTypeControl());
        map.setCurrentCity("上海");
        map.enableScrollWheelZoom(true);
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