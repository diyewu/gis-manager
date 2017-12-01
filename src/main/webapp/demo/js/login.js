var myChart = echarts.init(document.getElementById('main'));
var option = {
    backgroundColor: '#000',
    globe: {
        baseTexture: 'img/data-1491890179041-Hkj-elqpe.jpg',
        heightTexture: 'img/data-1491889019097-rJQYikcpl.jpg',
        displacementScale: 0.01,
        shading: 'lambert',
        environment: 'img/data-1491837999815-H1_44Qtal.jpg',
        light: {
            ambient: {
                intensity: 0.1
            },
            main: {
                intensity: 1.5
            }
        },
        layers: [{
            type: 'blend',
            blendTo: 'emission',
            texture: 'img/data-1491890291849-rJ2uee5ag.jpg'
        }, {
            type: 'overlay',
            texture: 'img/data-1491890092270-BJEhJg96l.png',
            shading: 'lambert',
            distance: 5
        }]
    },
    series: []
}
$(document).ready(function () {
    myChart.setOption(option);
    $('#loginBtn').click(function () {
        if (!$('.idBox').hasClass('bounceInLeft') || $('.idBox').hasClass('bounceOutLeft') || $(
                '.idBox').hasClass('register')) {
            $('.idBox').addClass('animated bounceInLeft login');
            $('.pwdBox').addClass('animated bounceInRight login');
            $('.codeBox').addClass('animated bounceInLeft login');
            $('.idBox').removeClass('bounceOutLeft register');
            $('.pwdBox').removeClass('bounceOutRight register');
            $('.codeBox').removeClass('bounceOutLeft register');
            $('.idBox').show();
            $('.forgetPwd').removeClass('bounceOutRight');
            $('.forgetPwd').addClass('bounceInRight');
            $('.pwdBox').show();
            $('.codeBox').show();
        } else {
            $('.idBox').removeClass('bounceInLeft');
            $('.pwdBox').removeClass('bounceInRight');
            $('.codeBox').removeClass('bounceInLeft');
            $('.idBox').addClass('bounceOutLeft');
            $('.pwdBox').addClass('bounceOutRight');
            $('.codeBox').addClass('bounceOutLeft');
        }
    })
    $('#registerBtn').click(function () {
        if (!$('.idBox').hasClass('bounceInLeft') || $('.idBox').hasClass('bounceOutLeft') || $('.idBox').hasClass('login')) {
            $('.codeBox').addClass('bounceOutLeft');
            $('.idBox').addClass('animated bounceInLeft register');
            $('.pwdBox').addClass('animated bounceInRight register');
            $('.idBox').removeClass('bounceOutLeft login');
            $('.pwdBox').removeClass('bounceOutRight login ');
            $('.forgetPwd').addClass('animated bounceOutRight');
            $('.idBox').show();
            $('.pwdBox').show();
        } else {
            $('.idBox').removeClass('bounceInLeft');
            $('.pwdBox').removeClass('bounceInRight');
            $('.idBox').addClass('bounceOutLeft');
            $('.pwdBox').addClass('bounceOutRight');
        }
    })
    $("#loginBtn_").click(function(){
    	window.location.href="index.jsp";
    });
});