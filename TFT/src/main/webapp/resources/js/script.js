var page;

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}

//Item hover Function
$(function() {
	$('.divTableCell').hover(function() {
		$(this).parent().parent().children().children().css('opacity', '0.6');
		$(this).parent().parent().children().first().children().eq($(this).attr('id')-1).css('opacity', '1');
		$(this).parent().children('#1').css('opacity', '1');
		$(this).css('opacity', '1');
	}, function() {
		$(this).parent().parent().children().children().css('opacity', '1');
	});
});

//tooltip reg
$(document).ready(function(){
    $('[data-toggle=tooltip]').tooltip();
    
  //search
    $("#summonerName").keyup(function(event) {
    	if (event.keyCode === 13) {
    		searchClick();
    	}
    });
});

function searchClick() {
	page = 10;
	if($('#summonerName').val() == "") {
		$('#summonerName').tooltip('enable');
		$('#summonerName').focus();
		return;
	} else {
		$('#summonerName').tooltip('disable');
	}
	$('#loading').show();
	$('#nosearch').hide();
	$('#nogame').hide();
	$('#result').hide();
	$('#toomany').hide();
	$('#done').hide();
	location.href = '#search';
	
	getSummonerInfo()
	.then(summonerjson => {
		Promise.all([getMatchInfo(), getChampionInfo(), getItemInfo(), getTraitsInfo()])
		.then(function (jsons) {
			var [matchjson, championjson, itemjson, traitjson] = jsons;
			$('#result').show();
			$('#loading').hide();
			var games = new Array();

			var html = "<div class='w3-container w3-padding-64 table-responsive'>"; 
			html += "<div class='w3-large w3-center'>" + $('#summonerName').val() + " 검색 결과<br><br></div>";
			if(matchjson.length == 0 ) {
				$('#nogame').show();
			}
			html += "<table class='table table-hover table-striped unitTable'>";
			$.each(matchjson, function(index, game){
				games.push(game);
			});
			$.each(games, function(key, value){
				var date = Unix_timestamp(value.info.game_datetime);
				var participants = new Array();
				participants = value.info.participants;
				$.each(participants, function(key, partivalue) {
					if(partivalue.puuid == summonerjson.puuid){
						var rank;
						if(value.info.queue_id == 1100) {
							rank = "랭크";
						} else {
							rank = "일반";
						}
						if(partivalue.placement > 4){
							html += "<tr><td style='background-color:#a0a0a0;'></td><td><span style='color:#a0a0a0;'>#"+ partivalue.placement + "위</span><br>" + rank +"<br>" + float_to_time(partivalue.time_eliminated) + "<br>레벨:" + partivalue.level + "</td>";
						} else if(partivalue.placement >= 2) {
							html += "<tr><td style='background-color:#207ac7;'></td><td><span style='color:#207ac7;'>#"+ partivalue.placement + "위</span><br>" + rank +"<br>" + float_to_time(partivalue.time_eliminated) + "<br>레벨:" + partivalue.level + "</td>";
						} else {
							html += "<tr><td style='background-color:#11b288;'></td><td><span style='color:#11b288;'>#"+ partivalue.placement + "위</span><br>" + rank +"<br>" + float_to_time(partivalue.time_eliminated) + "<br>레벨:" + partivalue.level + "</td>";
						}
						html += "<td class='w3-hide-small'>" + date + "</td>";
						html += "<td><div style='display:-webkit-box;'>";
						$.each(partivalue.traits, function(key, traits) {
							$.each(traitjson, function(key, trait) {
								if(trait.key == traits.name) {
									if(traits.tier_total == 3) {
										switch(traits.style) {
											case 3: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonGold' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									} else if(traits.tier_total == 2) {
										switch(traits.style) {
											case 3: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonGold' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									} else if(traits.tier_total == 1) {
										if(traits.style == 3) {
											html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonGold' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
										}
									}
								}
							});
						});
						$.each(partivalue.traits, function(key, traits) {
							$.each(traitjson, function(key, trait) {
								if(trait.key == traits.name) {
									if(traits.tier_total == 3) {
										switch(traits.style) {
											case 2: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonSilver' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									}
								}
							});
						});
						$.each(partivalue.traits, function(key, traits) {
							$.each(traitjson, function(key, trait) {
								if(trait.key == traits.name) {
									if(traits.tier_total == 3) {
										switch(traits.style) {
											case 1: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonBronze' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									} else if(traits.tier_total == 2) {
										switch(traits.style) {
											case 2: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonBronze' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											case 1: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonBronze' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									}
								}
							});
						});
						html += "</div></td>";
						html += "<td style='display:flex; width:686px;'>";
						$.each(partivalue.units, function(key, units) {
							html += "<div class=\"w3-center\" style=\"flex:1; padding:3px;\"><span style=\"color:#E1BD58;\">";
							for(var i = 0; i < units.tier; i++) {
								html += "<i class=\"fas fa-star\"></i>";
							}
							
							html += "<br><img src=\"/images/champions/" + units.character_id + 
							".png\" class=\"unitimg\" data-html=\"true\" data-placement=\"auto\" data-toggle=\"tooltip\" ";
							$.each(championjson, function(key, champion) {
								if(champion.championId == units.character_id) {
	 							html += "title=\"<div id=\'itemName\'>" + champion.name + "</div>가격 : " + champion.cost + " Gold<br>";
	 							var items = new Array();
		 						items = units.items;
		 						for(var j = 0; j < items.length; j++) {
		 							$.each(itemjson, function(key, item) {
		 								if(items[j] == item.id) {
		 									html += "<span id='combine' style='30px;'><img src='/images/items/" + item.name + ".png'></span>";
		 								}
		 							});
		 						}
	 							html += "\"></div>&nbsp";
								}
							});
						});
 						for(var k = partivalue.units.length; k < 10; k++) {
 							html += "<div class=\"w3-center\" style=\"flex:1; padding:3px;\"></div>"
 						}
						html += "</td>";
						html += "<td>라운드<br>" + partivalue.last_round +"</td>";
					}
				});
			});
			html += "</table></div>";
			html += "<div id='viewMore'></div>";
			if(matchjson.length == 10 ) {
				html += "<div class='w3-center'><button type=\"button\" class=\"w3-button w3-hover-red\" id=\"viewMore\" style=\"background-color: black; color: white;\" onclick=\"viewMore()\">VIEW MORE</button></div>";
			}
			$('#result').html(html);
			$('[data-toggle="tooltip"]').tooltip(); // 툴팁 재등록 
		}).catch(error => {
			console.log(error);
			console.log(error.status + " " + error.statusText);
			$('#nosearch').show();
			$('#loading').hide();
			$('#result').hide();
		});
	}).catch(error => {
		console.log(error);
		console.log(error.status + " " + error.statusText);
		$('#nosearch').show();
		$('#loading').hide();
		$('#result').hide();
	});
}

function viewMore() {
	console.log(page + "viewMoreClick");
	$('#loading').show();
	getSummonerInfo()
	.then(summonerjson => {
		Promise.all([getViewMore(), getChampionInfo(), getItemInfo(), getTraitsInfo()])
		.then(function (jsons) {
			var [matchjson, championjson, itemjson, traitjson] = jsons;
			$('#loading').hide();
			if(matchjson.length == 0) {
				$('#done').show();
				return;
			}
			var games = new Array();

			var html = "<div class='w3-container w3-padding-64 table-responsive'>"; 
			if(matchjson.length == 0 ) {
				$('#nogame').show();
			}
			html += "<table class='table table-hover table-striped unitTable'>";
			$.each(matchjson, function(index, game){
				games.push(game);
			});
			$.each(games, function(key, value){
				var date = Unix_timestamp(value.info.game_datetime);
				var participants = new Array();
				participants = value.info.participants;
				$.each(participants, function(key, partivalue) {
					if(partivalue.puuid == summonerjson.puuid){
						var rank;
						if(value.info.queue_id == 1100) {
							rank = "랭크";
						} else {
							rank = "일반";
						}
						if(partivalue.placement > 4){
							html += "<tr><td style='background-color:#a0a0a0;'></td><td><span style='color:#a0a0a0;'>#"+ partivalue.placement + "위</span><br>" + rank +"<br>" + float_to_time(partivalue.time_eliminated) + "<br>레벨:" + partivalue.level + "</td>";
						} else if(partivalue.placement >= 2) {
							html += "<tr><td style='background-color:#207ac7;'></td><td><span style='color:#207ac7;'>#"+ partivalue.placement + "위</span><br>" + rank +"<br>" + float_to_time(partivalue.time_eliminated) + "<br>레벨:" + partivalue.level + "</td>";
						} else {
							html += "<tr><td style='background-color:#11b288;'></td><td><span style='color:#11b288;'>#"+ partivalue.placement + "위</span><br>" + rank +"<br>" + float_to_time(partivalue.time_eliminated) + "<br>레벨:" + partivalue.level + "</td>";
						}
						html += "<td class='w3-hide-small'>" + date + "</td>";
						html += "<td><div style='display:-webkit-box;'>";
						$.each(partivalue.traits, function(key, traits) {
							$.each(traitjson, function(key, trait) {
								if(trait.key == traits.name) {
									if(traits.tier_total == 3) {
										switch(traits.style) {
											case 3: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonGold' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									} else if(traits.tier_total == 2) {
										switch(traits.style) {
											case 3: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonGold' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									} else if(traits.tier_total == 1) {
										if(traits.style == 3) {
											html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonGold' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
										}
									}
								}
							});
						});
						$.each(partivalue.traits, function(key, traits) {
							$.each(traitjson, function(key, trait) {
								if(trait.key == traits.name) {
									if(traits.tier_total == 3) {
										switch(traits.style) {
											case 2: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonSilver' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									}
								}
							});
						});
						$.each(partivalue.traits, function(key, traits) {
							$.each(traitjson, function(key, trait) {
								if(trait.key == traits.name) {
									if(traits.tier_total == 3) {
										switch(traits.style) {
											case 1: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonBronze' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									} else if(traits.tier_total == 2) {
										switch(traits.style) {
											case 2: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonBronze' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											case 1: html += "<div data-html=\"true\" data-placement=\"top\" data-toggle=\"tooltip\" title=\"<div class='trait'>" + traits.num_units + " "  + trait.name + "</div>\"><div class='hexagonBronze' style=''><img class='traits' src='/images/traits/" + traits.name + ".png'></div></div>";
													break;
											default: break;
										}
									}
								}
							});
						});
						html += "</div></td>";
						html += "<td style='display:flex; width:686px;'>";
						$.each(partivalue.units, function(key, units) {
							html += "<div class=\"w3-center\" style=\"flex:1; padding:3px;\"><span style=\"color:#E1BD58;\">";
							for(var i = 0; i < units.tier; i++) {
								html += "<i class=\"fas fa-star\"></i>";
							}
							
							html += "<br><img src=\"/images/champions/" + units.character_id + 
							".png\" class=\"unitimg\" data-html=\"true\" data-placement=\"auto\" data-toggle=\"tooltip\" ";
							$.each(championjson, function(key, champion) {
								if(champion.championId == units.character_id) {
	 							html += "title=\"<div id=\'itemName\'>" + champion.name + "</div>가격 : " + champion.cost + " Gold<br>";
	 							var items = new Array();
		 						items = units.items;
		 						for(var j = 0; j < items.length; j++) {
		 							$.each(itemjson, function(key, item) {
		 								if(items[j] == item.id) {
		 									html += "<span id='combine' style='30px;'><img src='/images/items/" + item.name + ".png'></span>";
		 								}
		 							});
		 						}
	 							html += "\"></div>&nbsp";
								}
							});
						});
 						for(var k = partivalue.units.length; k < 10; k++) {
 							html += "<div class=\"w3-center\" style=\"flex:1; padding:3px;\"></div>"
 						}
						html += "</td>";
						html += "<td>라운드<br>" + partivalue.last_round +"</td>";
					}
				});
			});
			html += "</table></div>";
			$('#viewMore').append(html);
			page += 10;
			$('[data-toggle="tooltip"]').tooltip(); // 툴팁 재등록 
		}).catch(error => {
			console.log(error);
			console.log(error.status + " " + error.statusText);
			$('#loading').hide();
			$('#toomany').show();
		});
	}).catch(error => {
		console.log(error);
		console.log(error.status + " " + error.statusText);
		$('#loading').hide();
		$('#toomany').show();
	});
}



//로드시 실행
$(window).load(function() {    
    //로딩이미지 숨김
	$('#loading').hide();
	$('#nogame').hide();
	$('#toomany').hide();
	$('#done').hide();
	$('#summonerName').tooltip({trigger: 'focus'})
	$('#summonerName').tooltip('disable');
    
    //시너지 목록 작성
	//synergyContainer
	Promise.all([getChampionInfo(), getTraitsInfo()])
	.then(function(jsons) {
		var [championjson, traitjson] = jsons;
		var html = "";
		html += "<div class=\"w3-row-padding\" style='font-size:13px!important;'>"
		$.each(traitjson, function(key, trait) {
			html += "<div class=\"w3-col m3\" style=\"height:290px; margin:1px; padding:5px; background-color:#f5f5f5;\">";
			html += "<div style='border-bottom:3px solid black;border-left:1px solid black;border-right:1px solid black; box-shadow: 0 0 5px rgba(0,0,0,0.6);'><div style=\"background-color:#2c2c2c;\"><div class=\"hexagonGray\"><img src=\"/images/traits/" + trait.key + ".png\" class=\"traits\"></div><div style=\'color:white; font-weight:bold; text-align:center;\'>" + trait.name + "</div></div>";
			html += "<div style='text-align:center;'>";
			$.each(championjson, function(key, champion) {
				$.each(champion.traits, function(index, value) {
					if(trait.name == value) {
						html += "<img src=\"/images/champions/" + champion.championId + ".png\" style='width:20%; margin:1px; border-radius: 5px;'  data-html=\"true\" data-placement=\"auto\" data-toggle=\"tooltip\" title=\"" + champion.name + "\">";
					}
				});
			});
			html += "</div>";
			html += "<div class=\"w3-center\"><div style=\'color:black;\'>" + trait.description + "</div></div>";
			html += "<div class=\"w3-center\"><div>" + trait.innate + "</div></div></div>";
			html += "</div>";
		});
		html += "</div>";
		$('#synergyContainer').html(html);
		$('[data-toggle="tooltip"]').tooltip(); // 툴팁 재등록 
	}).catch(error => {
		console.log(error);
		console.log(error.status + " " + error.statusText);
		$('#synergyContainer').html("<h1>에러</h1>");
	});
});

//유닉스타임스탬프 변환
function Unix_timestamp(t) {
	var date = new Date(t);
	return date.toLocaleString();
}

//float 형 시간 변환
function float_to_time(num) {
	var temp = Math.round(num);
	var hour = Math.floor(temp / 3600);
	var minute = Math.floor(temp / 60);
	var second = temp % 60
	var timeStr = "";
	if(hour >= 1) {
		timeStr += hour + "시";	
	}
	if(minute >= 1) {
		timeStr += minute + "분";
	}
	timeStr += (temp % 60) + "초";
	return timeStr;
}

//SummonerInfo JSON
function getSummonerInfo() {
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "summonerInfo",
			type: "GET",
			mimeType: "application/json",
			data: { 
				"summonerName" : $('#summonerName').val()
			},
			success: function(data) {
				resolve(data);
			},
			error: function(error) {
				reject(error);
			}
		});
	});
}

//MatchInfo JSON
function getMatchInfo() {
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "matchInfo",
 			type: "GET",
  			mimeType: "application/json", 
 			success: function(data) {
 				resolve(data);
 			},
 			error: function(error) {
 				reject(error);
 			}
		});
	});
}

//ChampionInfo JSON
function getChampionInfo() {
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "./json/champions.json",
 			type: "GET",
 			mimeType: "application/json",
 			success: function(data) {
 				resolve(data);
 			},
 			error: function(error) {
 				reject(error);
 			}
		});
	});
}

//ItemInfo JSON
function getItemInfo() {
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "./json/items.json",
 			type: "GET",
 			mimeType: "application/json",
 			success: function(data) {
 				resolve(data);
 			},
 			error: function(error) {
 				reject(error);
 			}
		});
	});
}

//TraitsInfo JSON
function getTraitsInfo() {
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "./json/traits.json",
 			type: "GET",
 			mimeType: "application/json",
 			success: function(data) {
 				resolve(data);
 			},
 			error: function(error) {
 				reject(error);
 			}
		});
	});
}

//viewMore JSON
function getViewMore() {
	return new Promise((resolve, reject) => {
		$.ajax({
			url: "viewMore",
			type: "GET",
			mimeType: "application/json",
			data: { 
				"summonerName" : $('#summonerName').val(),
				"page" : page
			},
			success: function(data) {
				resolve(data);
			},
			error: function(error) {
				reject(error);
			}
		});
	});
}