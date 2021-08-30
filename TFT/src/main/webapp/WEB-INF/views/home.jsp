<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>전략적 팀 전투 전적검색 - 시즌 3</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/script.js"></script>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top" style="color: white; z-index: 100;">
  <div class="w3-bar" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="#home" class="w3-bar-item w3-button"><i class="fa fa-home"></i> 홈</a>
    <a href="#search" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-thumbs-up"></i> 검색 결과</a>
    <a href="#synergy" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i> 시너지</a>
    <a href="#item" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-toolbox"></i> 아이템</a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
    <a href="#search" class="w3-bar-item w3-button" onclick="toggleFunction()">검색 결과</a>
    <a href="#synergy" class="w3-bar-item w3-button" onclick="toggleFunction()">시너지</a>
    <a href="#item" class="w3-bar-item w3-button" onclick="toggleFunction()">아이템</a>
  </div>
</div>

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <div class="w3-display-middle" style="white-space:nowrap; top:35%!important">
    <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">전략적 팀 전투 <span class="w3-hide-small">전적검색</span></span>
  </div>
  <div class="w3-display-middle" style="white-space:nowrap;">
  	<input style="border:none; padding-top: 5px; padding-bottom: 9px; padding-left: 10px; padding-right: 10px;" type="text" placeholder="소환사 이름" id="summonerName" data-html="true" title="<i class='fas fa-bell'></i> 소환사 이름을 입력하세요.">
  	<button type="button" class="w3-button w3-hover-red" id="searchBtn" style="background-color: black; color: white;" onclick="searchClick()">
  		<i class="fa fa-search"></i> SEARCH
  	</button>
  </div>
</div>

<!-- Container (About Section) -->
<div class="w3-content w3-container w3-padding-64" id="search" style="max-width:1300px">
	<h3 class="w3-center" id="nosearch">아직 검색하지 않으셨어요!</h3>
	<div id="result"></div>
	<div id="loading" class="w3-center"><img id="loading-image" src="./images/loading.gif" alt="Loading..." style="width: 30%;"/></div>
	<h3 class="w3-center" id="nogame">시즌 3 전략적 팀 전투를 플레이하지 않았습니다!</h3>
	<h3 class="w3-center" id="toomany">너무 잦은 요청입니다 2분 후 다시 시도하세요.</h3>
	<h3 class="w3-center" id="done">모든 게임을 검색했습니다.</h3>
</div>

<!-- Second Parallax Image with Portfolio Text -->
<div class="bgimg-2 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
    <span class="w3-xxlarge w3-text-white w3-wide">SYNERGY</span>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div class="w3-content w3-container w3-padding-64" id="synergy">
	<div id="synergyContainer"></div>
</div>

<!-- Item Text -->
<div class="bgimg-3 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
     <span class="w3-xxlarge w3-wide" style="color:black;">ITEM</span>
  </div>
</div>

<!-- Container (Item Section) -->
	<div class="w3-content w3-container w3-padding-64" id="item">
		<div class="w3-table">
			<div class="divTableBody">
				<div class="divTableRow">
					<div class="divTableCell" id="1"></div>
					<div class="divTableCell" id="2">
						<img src="./images/items/B.F. 대검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>B.F. 대검</div> 공격력 +15">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/곡궁.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>곡궁</div> 공격 속도 +15%">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/쇠사슬 조끼.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>쇠사슬 조끼</div> 방어력 +25">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/음전자 망토.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>음전자 망토</div> 마법 저항력 +25">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/쓸데없이 큰 지팡이.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>쓸데없이 큰 지팡이</div> 주문력 + 20%">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/여신의 눈물.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>여신의 눈물</div> 시작 마나 + 20">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/거인의 허리띠.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>거인의 허리띠</div> 체력 +200">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/뒤집개.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>뒤집개</div> 특별한 능력을 얻음">
					</div>
					<div class="divTableCell" id="10" >
						<img src="./images/items/연습용 장갑.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>연습용 장갑</div> 회피 확률 +10%<br>치명타 확률 +10%">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/B.F. 대검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>B.F. 대검</div> 공격력 +15">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/죽음의 검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>죽음의 검</div> 적 처치 또는 처치 관여 시 전투가 끝날 때까지 공격력이 +15 증가합니다. (무제한 중첩 가능)<div id='effect'>공격력 +15</div><div id='effect'>공격력 +15</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/B.F. 대검.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/거인 학살자.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>거인 학살자</div> 적 현재 체력의 9%에 해당되는 물리 피해를 추가로 입힙니다.<div id='effect'>공격력 +15</div><div id='effect'>공격 속도 +15%</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/곡궁.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/수호 천사.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>수호 천사</div> 장착 상태에서 사망시 400의 체력을 지닌 채 부활<div id='effect'>공격력 +15</div><div id='effect'>방어력 +25</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/쇠사슬 조끼.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/피바라기.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>피바라기</div> 공격 시 가한 피해량의 50%만큼 체력 회복<div id='effect'>공격력 +15</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/마법공학 총검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>마법공학 총검</div> 가한 모든 피해량의 33%만큼 체력 회복<div id='effect'>공격력 +15</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/쇼진의 창.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>쇼진의 창</div> 스킬 사용 후 공격할 때마다 최대 마나의 18%에 해당하는 만큼 마나 회복<div id='effect'>공격력 +15</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/지크의 전령.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>지크의 전령</div> 전투 시작 시 보유한 챔피언과 좌우로 두 칸 안에 있는 아군의 공격속도가 남은 전투 시간 동안 +20% 증가<div id='effect'>공격력 +15</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/몰락한 왕의 검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>몰락한 왕의 검</div> 장착 시 검사 특성 획득<div id='effect'>공격력 +15</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/무한의 대검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>무한의 대검</div> 치명타 공격 시 +100%의 피해<div id='effect'>공격력 +15</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/곡궁.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>곡궁</div> 공격 속도 +15%">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/거인 학살자.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>거인 학살자</div> 적 현재 체력의 9%에 해당되는 물리 피해를 추가로 입힙니다.<div id='effect'>공격력 +15</div><div id='effect'>공격 속도 +15%</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/곡궁.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/고속 연사포.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>고속 연사포</div> 공격 사거리가 두 배로 증가<div id='effect'>공격 속도 +15%</div><div id='effect'>공격 속도 +15%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/곡궁.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/거인의 결의.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>거인의 결의</div> 피해를 입거나 치명타 피해를 입힐 때마다 추가 피해량이 2%씩 증가합니다. 이 효과는 최대 100%까지 중첩됩니다. 효과가 50회 중첩되면 방어력과 마법 저향력이 25 증가하며 몸짓이 커집니다. 효과는 매 라운드 초기화됩니다.<div id='effect'>공격 속도 +15%</div><div id='effect'>방어력 +25</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/쇠사슬 조끼.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/루난의 허리케인.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>루난의 허리케인</div> 착용자의 공격을 따라 하면 60%의 피해를 입히는 영혼 소환<div id='effect'>공격 속도 +15%</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/구인수의 격노검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>구인수의 격노검</div> 공격시 공격 속도가 5% 증가 (무제한 중첩)<div id='effect'>공격 속도 +15%</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/스태틱의 단검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>스태틱의 단검</div> 세 번째 공격마다 3 / 4 / 5명의 적에게 85의 마법 피해를 입힙니다.(스태틱의 단검을 장착한 챔피언의 등급에 따라 마법 피해를 입히는 대상 적 챔피언 수가 증가합니다.)<div id='effect'>공격 속도 +15%</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/즈롯 차원문.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>즈롯 차원문</div> 사망 시 1000 / 2000 / 3000의 체력을 지닌 인공체가 깨어나 전투에 참여<div id='effect'>공격 속도 +15%</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/잠입자의 발톱.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>잠입자의 발톱</div> 장착 시 잠입자 특성 획득<div id='effect'>공격 속도 +15%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/최후의 속삭임.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>최후의 속삭임</div> 치명타 공격 시 3초 동안 적의 방어력을 90% 감소시킵니다. 이 효과는 중첩되지 않습니다.<div id='effect'>공격 속도 +15%</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/쇠사슬 조끼.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>쇠사슬 조끼</div> 방어력 +25">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/수호 천사.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>수호 천사</div> 장착 상태에서 사망시 400의 체력을 지닌 채 부활<div id='effect'>공격력 +15</div><div id='effect'>방어력 +25</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/쇠사슬 조끼.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/거인의 결의.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>거인의 결의</div> 피해를 입거나 치명타 피해를 입힐 때마다 추가 피해량이 2%씩 증가합니다. 이 효과는 최대 100%까지 중첩됩니다. 효과가 50회 중첩되면 방어력과 마법 저향력이 25 증가하며 몸짓이 커집니다. 효과는 매 라운드 초기화됩니다.<div id='effect'>공격 속도 +15%</div><div id='effect'>방어력 +25</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/쇠사슬 조끼.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/덤불 조끼.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>덤불 조끼</div> 치명타 추가 피해량을 입지 않습니다. 기본 공격을 받으면 주변에 있는 모든 적에게 100 / 140 / 200의 마법 피해를 입힙니다.(이 효과는 초당 최대 한 번만 발동됩니다.)마법 피해량은 덤불 조끼를 장착한 챔피언의 등급에 따라 증가합니다.<div id='effect'>방어력 +25</div><div id='effect'>방어력 +25</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/쇠사슬 조끼.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/파쇄검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>파쇄검</div> 25% 확률로 3초 동안 적 무장 해제<div id='effect'>방어력 +25</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/강철의 솔라리 펜던트.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>강철의 솔라리 펜던트</div> 같은 줄 2칸 안에 있는 아군에게 8초 동안 250 / 275 / 350의 피해량을 흡수하는 보호막을 씌웁니다.(보호막 흡수량은 강철의 솔라리 펜던트를 장착한 챔피언의 등급에 따라 증가합니다.)<div id='effect'>방어력 +25</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/얼어붙은 심장.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>얼어붙은 심장</div> 주변 적의 공격 속도 40% 감소(효과 중첩 시 범위가 증가하며 둔화 수치는 증가하지 않습니다.)<div id='effect'>방어력 +25</div><div id='effect'>시작마나 +20</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/붉은 덩굴 정령.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>붉은 덩굴정령</div> 공격 시 적을 불태워 10초 동안 적 최대 체력의 18%에 해당하는 피해를 추가로 입힙니다.<div id='effect'>방어력 +25</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/반군의 메달.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>반군의 메달</div> 장착 시 반군 특성 획득<div id='effect'>방어력 +20</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/침묵의 장막.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>침묵의 장막</div> 전투 시작 시 광선을 발사해 적중당한 적들의 최대 마나를 40% 증가시켜 첫 스킬 사용을 지연<div id='effect'>방어력 +25</div><div id='effect'>+10% 회피 확률<br>+10% 치명타 확률</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/음전자 망토.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>음전자 망토</div> 마법 저항력 +25">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/피바라기.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>피바라기</div> 공격 시 가한 피해량의 50%만큼 체력 회복<div id='effect'>공격력 +15</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/루난의 허리케인.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>루난의 허리케인</div> 착용자의 공격을 따라 하면 60%의 피해를 입히는 영혼 소환<div id='effect'>공격 속도 +15%</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/파쇄검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>파쇄검</div> 25% 확률로 3초 동안 적 무장 해제<div id='effect'>방어력 +25</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/용의 발톱.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>용의 발톱</div> 마법 저항력 50% 증가<div id='effect'>마법 저항력 +25</div><div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/음전자 망토.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/이온 충격기.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>이온 충격기</div> 주변 3칸 안에 있는 적이 스킬을 사용하면 이온 충격을 가해 적 챔피언 최대 마나의 225%에 해당하는 마법 피해를 입힙니다.<div id='effect'>마법 저항력 +25</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/호의의 성배.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>호의의 성배</div> 스킬 사용 시 2칸 내에 있는 모든 아군의 마나 10 회복<div id='effect'>마법 저항력 +25</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/서풍.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>서풍</div> 전투 시작 시 적 하나를 6초 동안 추방<div id='effect'>마법 저항력 +25</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/천상의 구.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>천상의 구</div> 장착 시 천상 특성 획득<div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/수은.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>수은</div> [고유 효과]장착 시 군중 제어 효과에 면역이 됩니다.<div id='effect'>마법 저항력 +25</div><div id='effect'>회피 확률 +20%</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/쓸데없이 큰 지팡이.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>쓸데없이 큰 지팡이</div> 주문력 + 20%">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/마법공학 총검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>마법공학 총검</div> 가한 모든 피해량의 33%만큼 체력 회복<div id='effect'>공격력 +15</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/구인수의 격노검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>구인수의 격노검</div> 공격시 공격 속도가 5% 증가 (무제한 중첩)<div id='effect'>공격 속도 +15%</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/강철의 솔라리 펜던트.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>강철의 솔라리 펜던트</div> 같은 줄 2칸 안에 있는 아군에게 8초 동안 250 / 275 / 350의 피해량을 흡수하는 보호막을 씌웁니다.(보호막 흡수량은 강철의 솔라리 펜던트를 장착한 챔피언의 등급에 따라 증가합니다.)<div id='effect'>방어력 +25</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/이온 충격기.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>이온 충격기</div> 주변 3칸 안에 있는 적이 스킬을 사용하면 이온 충격을 가해 적 챔피언 최대 마나의 225%에 해당하는 마법 피해를 입힙니다.<div id='effect'>마법 저항력 +25</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/라바돈의 죽음모자.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>라바돈의 죽음모자</div> 장착 시 주문력 75% 증가<div id='effect'>주문력 +20%</div><div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/쓸데없이 큰 지팡이.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/루덴의 메아리.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>루덴의 메아리</div> 스킬 적중 시 150 / 175 / 225의 마법 피해를 입힙니다.(마법 피해량은 루덴의 메아리를 장착한 챔피언의 등급에 따라 증가합니다.)<div id='effect'>주문력 +20%</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/모렐로노미콘.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>모렐로노미콘</div> 스킬 공격 시 적을 불태워 10초에 걸쳐 적 최대 체력의 18%에 해당하는 피해를 입히고 체력 효과 효과 무효화<div id='effect'>주문력 +20%</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/폭파광의 화약.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>폭파광의 화약</div> 장착 시 폭파광 특성 획득<div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/보석 건틀릿.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>보석 건틀릿</div> 스킬에 치명타가 적용될 수 있습니다.<div id='effect'>주문력 +20%</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/여신의 눈물.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>여신의 눈물</div> 시작 마나 + 20">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/쇼진의 창.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>쇼진의 창</div> 스킬 사용 후 공격할 때마다 최대 마나의 18%에 해당하는 만큼 마나 회복<div id='effect'>공격력 +15</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/스태틱의 단검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>스태틱의 단검</div> 세 번째 공격마다 3 / 4 / 5명의 적에게 85의 마법 피해를 입힙니다.(스태틱의 단검을 장착한 챔피언의 등급에 따라 마법 피해를 입히는 대상 적 챔피언 수가 증가합니다.)<div id='effect'>공격 속도 +15%</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/얼어붙은 심장.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>얼어붙은 심장</div> 주변 적의 공격 속도 40% 감소(효과 중첩 시 범위가 증가하며 둔화 수치는 증가하지 않습니다.)<div id='effect'>방어력 +25</div><div id='effect'>시작마나 +20</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/호의의 성배.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>호의의 성배</div> 스킬 사용 시 2칸 내에 있는 모든 아군의 마나 10 회복<div id='effect'>마법 저항력 +25</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/루덴의 메아리.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>루덴의 메아리</div> 스킬 적중 시 150 / 175 / 225의 마법 피해를 입힙니다.(마법 피해량은 루덴의 메아리를 장착한 챔피언의 등급에 따라 증가합니다.)<div id='effect'>주문력 +20%</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/대천사의 포옹.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>대천사의 포옹</div> 장착 시 스킬 사용 후 20의 마나 회복<div id='effect'>시작 마나 +20</div><div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/여신의 눈물.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/구원.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>구원</div> 체력이 30% 아래로 떨어지면 주변 모든 아군의 체력을 1200만큼 회복<div id='effect'>시작 마나 +20</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/별 수호자의 부적.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>별 수호자의 부적</div> 장착 시 별 수호자 특성 획득<div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/정의의 손길.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>정의의 손길</div> 준비 단계에서 '피해량 50% 증가 효과' 또는 '공격 시 50의 체력 회복 효과' 중 하나를 라운드 종료까지 획득합니다.<div id='effect'>시작 마나 +20</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/거인의 허리띠.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>거인의 허리띠</div> 체력 +200">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/지크의 전령.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>지크의 전령</div> 전투 시작 시 보유한 챔피언과 좌우로 두 칸 안에 있는 아군의 공격속도가 남은 전투 시간 동안 +20% 증가<div id='effect'>공격력 +15</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/즈롯 차원문.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>즈롯 차원문</div> 사망 시 1000 / 2000 / 3000의 체력을 지닌 인공체가 깨어나 전투에 참여<div id='effect'>공격 속도 +15%</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/붉은 덩굴 정령.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>붉은 덩굴정령</div> 공격 시 적을 불태워 10초 동안 적 최대 체력의 18%에 해당하는 피해를 추가로 입힙니다.<div id='effect'>방어력 +25</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/서풍.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>서풍</div> 전투 시작 시 적 하나를 6초 동안 추방<div id='effect'>마법 저항력 +25</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/모렐로노미콘.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>모렐로노미콘</div> 스킬 공격 시 적을 불태워 10초에 걸쳐 적 최대 체력의 18%에 해당하는 피해를 입히고 체력 효과 효과 무효화<div id='effect'>주문력 +20%</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/구원.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>구원</div> 체력이 30% 아래로 떨어지면 주변 모든 아군의 체력을 1200만큼 회복<div id='effect'>시작 마나 +20</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/워모그의 갑옷.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>워모그의 갑옷</div> 초당 잃은 체력의 6%만큼 체력 회복<div id='effect'>체력 +200</div><div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/거인의 허리띠.png'> + <img src='./images/items/거인의 허리띠.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/수호자의 흉갑.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>수호자의 흉갑</div> 장착 시 수호자 특성 획득<div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/거인의 허리띠.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/덫 발톱.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>덫 발톱</div> 전투가 시작될 때 주문 보호막을 획득합니다. 주문보호막을 파괴한 적은 4초간 기절합니다.<div id='effect'>체력 +200</div><div id='effect'>회피 확률 +20%</div><span id='combine'><img src='./images/items/거인의 허리띠.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/뒤집개.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>뒤집개</div> 특별한 능력을 얻음">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/요우무의 유령검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>요우무의 유령검</div> 추가 공격력 +20. 장착 시 암살자 특성 획득<div id='effect'>공격력 +15</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/몰락한 왕의 검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>몰락한 왕의 검</div> 추가 공격 속도 +20%. 장착 시 검사 특성 획득<div id='effect'>공격 속도 +15%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/반군의 메달.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>반군의 메달</div> 장착 시 반군 특성 획득<div id='effect'>방어력 +20</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/천상의 구.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>천상의 구</div> 장착 시 천상 특성 획득<div id='effect'>마법 저항력 +25</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/폭파광의 화약.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>폭파광의 화약</div> 장착 시 폭파광 특성 획득<div id='effect'>주문력 +20%</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/별 수호자의 부적.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>별 수호자의 부적</div> 장착 시 별 수호자 특성 획득<div id='effect'>시작 마나 +20</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/수호자의 흉갑.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>수호자의 흉갑</div> 장착 시 수호자 특성 획득<div id='effect'>체력 +200</div><span id='combine'><img src='./images/items/거인의 허리띠.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/대자연의 힘.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>대자연의 힘</div> 팀 규모 +1 증가<br><span id='combine'><img src='./images/items/뒤집개.png'> + <img src='./images/items/뒤집개.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/암흑의 별 심장.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>암흑의 별 심장</div> 장착 시 암흑의 별 특성 획득<div id='effect'>+10% 회피 확률<br>+10% 치명타 확률</div><span id='combine'><img src='./images/items/뒤집개.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableCell" id="1">
						<img src="./images/items/연습용 장갑.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>연습용 장갑</div> 회피 확률 +10%<br>치명타 확률 +10%">
					</div>
					<div class="divTableCell" id="2">
						<img src="./images/items/무한의 대검.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>무한의 대검</div> 치명타 공격 시 +100%의 피해<div id='effect'>공격력 +15</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/B.F. 대검.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="3">
						<img src="./images/items/최후의 속삭임.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>최후의 속삭임</div> 치명타 공격 시 3초 동안 적의 방어력을 90% 감소시킵니다. 이 효과는 중첩되지 않습니다.<div id='effect'>공격 속도 +15%</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/곡궁.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="4">
						<img src="./images/items/침묵의 장막.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>침묵의 장막</div> 전투 시작 시 광선을 발사해 적중당한 적들의 최대 마나를 40% 증가시켜 첫 스킬 사용을 지연<div id='effect'>방어력 +25</div><div id='effect'>+10% 회피 확률<br>+10% 치명타 확률</div><span id='combine'><img src='./images/items/쇠사슬 조끼.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="5">
						<img src="./images/items/수은.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>수은</div> [고유 효과]장착 시 군중 제어 효과에 면역이 됩니다.<div id='effect'>마법 저항력 +25</div><div id='effect'>회피 확률 +20%</div><span id='combine'><img src='./images/items/음전자 망토.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="6">
						<img src="./images/items/보석 건틀릿.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>보석 건틀릿</div> 스킬에 치명타가 적용될 수 있습니다.<div id='effect'>주문력 +20%</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/쓸데없이 큰 지팡이.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="7">
						<img src="./images/items/정의의 손길.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>정의의 손길</div> 준비 단계에서 '피해량 50% 증가 효과' 또는 '공격 시 50의 체력 회복 효과' 중 하나를 라운드 종료까지 획득합니다.<div id='effect'>시작 마나 +20</div><div id='effect'>치명타 확률 +20%</div><span id='combine'><img src='./images/items/여신의 눈물.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="8">
						<img src="./images/items/덫 발톱.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>덫 발톱</div> 전투가 시작될 때 주문 보호막을 획득합니다. 주문보호막을 파괴한 적은 4초간 기절합니다.<div id='effect'>체력 +200</div><div id='effect'>회피 확률 +20%</div><span id='combine'><img src='./images/items/거인의 허리띠.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="9">
						<img src="./images/items/암흑의 별 심장.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>암흑의 별 심장</div> 장착 시 암흑의 별 특성 획득<div id='effect'>+10% 회피 확률<br>+10% 치명타 확률</div><span id='combine'><img src='./images/items/뒤집개.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
					<div class="divTableCell" id="10">
						<img src="./images/items/도적의 장갑.png" data-html="true" data-placement="auto" data-toggle="tooltip" title="<div id='itemName'>도적의 장갑</div> 라운드 시작 시 임시 아이템 2개가 추가로 장착됩니다. 임시 아이템 2개의 등급은 플레이어 레벨에 따라 달라집니다.[아이템 슬롯 3칸 소모]<div id='effect'>+10% 회피 확률<br>+10% 치명타 확률</div><div id='effect'>+10% 회피 확률<br> +10% 치명타 확률</div><span id='combine'><img src='./images/items/연습용 장갑.png'> + <img src='./images/items/연습용 장갑.png'></span>">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
  <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
  	<a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-square w3-hover-opacity" style="color: white;"></i></a>
    <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram w3-hover-opacity" style="color: white;"></i></a>
    <a href="https://www.snapchat.com" target="_blank"><i class="fab fa-snapchat-square w3-hover-opacity" style="color: white;"></i></a>
    <a href="https://www.pinterest.com" target="_blank"><i class="fab fa-pinterest-square w3-hover-opacity" style="color: white;"></i></a>
    <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter-square w3-hover-opacity" style="color: white;"></i></a>
    <a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin w3-hover-opacity" style="color: white;"></i></a>
  </div>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>
</body>
</html>