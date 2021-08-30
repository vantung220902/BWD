(function(){var $,ele,container,canvas,num,prizes,btn,deg=0,fnGetPrize,fnGotBack,optsPrize;var cssPrefix,eventPrefix,vendors={"":"",Webkit:"webkit",Moz:"",O:"o",ms:"ms"},testEle=document.createElement("p"),cssSupport={};Object.keys(vendors).some(function(vendor){if(testEle.style[vendor+(vendor?"T":"t")+"ransitionProperty"]!==undefined){cssPrefix=vendor?"-"+vendor.toLowerCase()+"-":"";eventPrefix=vendors[vendor];return!0}});function normalizeEvent(name){return eventPrefix?eventPrefix+name:name.toLowerCase()}
function normalizeCss(name){name=name.toLowerCase();return cssPrefix?cssPrefix+name:name}
cssSupport={cssPrefix:cssPrefix,transform:normalizeCss("Transform"),transitionEnd:normalizeEvent("TransitionEnd")};var transform=cssSupport.transform;var transitionEnd=cssSupport.transitionEnd;function init(opts){fnGetPrize=opts.getPrize;fnGotBack=opts.gotBack;opts.config(function(data){prizes=opts.prizes=data;num=prizes.length;draw(opts)});events()}
$=function(id){return document.getElementById(id)};function draw(opts){opts=opts||{};if(!opts.id||num>>>0===0)
return;var id=opts.id,rotateDeg=360/num/2+90,ctx,prizeItems=document.createElement("ul"),turnNum=1/num,html=[];ele=$(id);canvas=ele.querySelector(".hc-luckywheel-canvas");container=ele.querySelector(".hc-luckywheel-container");btn=ele.querySelector(".hc-luckywheel-btn");if(!canvas.getContext){showMsg("Browser is not support");return}
ctx=canvas.getContext("2d");for(var i=0;i<num;i++){ctx.save();ctx.beginPath();ctx.translate(250,250);ctx.moveTo(0,0);ctx.rotate((((360/num)*i-rotateDeg)*Math.PI)/180);ctx.arc(0,0,250,0,(2*Math.PI)/num,!1);if(i%2==0){ctx.fillStyle="#87CEFA"}else{ctx.fillStyle="#5F9EA0"}
ctx.fill();ctx.lineWidth=1;ctx.strokeStyle="#e4370e";ctx.stroke();ctx.restore();var prizeList=opts.prizes;html.push('<li class="hc-luckywheel-item"> <span style="');html.push(transform+": rotate("+i*turnNum+'turn)">');if(opts.mode=="both"){html.push("<p id='curve'>"+prizeList[i].text+"</p>");html.push('<img src="'+prizeList[i].img+'" />')}else if(prizeList[i].img){html.push('<img src="'+prizeList[i].img+'" />')}else{html.push('<p id="curve">'+prizeList[i].text+"</p>")}
html.push("</span> </li>");if(i+1===num){prizeItems.className="hc-luckywheel-list";container.appendChild(prizeItems);prizeItems.innerHTML=html.join("")}}}
function showMsg(msg){alert(msg)}
function runRotate(deg){container.style[transform]="rotate("+deg+"deg)"}
function events(){bind(btn,"click",function(){addClass(btn,"disabled");fnGetPrize(function(data){if(data[0]==null&&!data[1]==null){return}
optsPrize={prizeId:data[0],chances:data[1]};deg=deg||0;deg=deg+(360-(deg%360))+(360*10-data[0]*(360/num));runRotate(deg)});bind(container,transitionEnd,eGot)})}
function eGot(){if(optsPrize.chances==null){return fnGotBack(null)}else{removeClass(btn,"disabled");return fnGotBack(prizes[optsPrize.prizeId].text)}}
function bind(ele,event,fn){if(typeof addEventListener==="function"){ele.addEventListener(event,fn,!1)}else if(ele.attachEvent){ele.attachEvent("on"+event,fn)}}
function hasClass(ele,cls){if(!ele||!cls)
return!1;if(ele.classList){return ele.classList.contains(cls)}else{return ele.className.match(new RegExp("(\\s|^)"+cls+"(\\s|$)"))}}
function addClass(ele,cls){if(ele.classList){ele.classList.add(cls)}else{if(!hasClass(ele,cls))
ele.className+=""+cls}}
function removeClass(ele,cls){if(ele.classList){ele.classList.remove(cls)}else{ele.className=ele.className.replace(new RegExp("(^|\\b)"+className.split(" ").join("|")+"(\\b|$)","gi")," ")}}
var hcLuckywheel={init:function(opts){return init(opts)}};window.hcLuckywheel===undefined&&(window.hcLuckywheel=hcLuckywheel);if(typeof define=="function"&&define.amd){define("HellCat-Luckywheel",[],function(){return hcLuckywheel})}})()