//best매출

//best매출 연령
function getAgeBestPay(agePay){
	
	const ageObj = {
		"age60Pay" : "60대",
		"age50Pay" : "50대",
		"age40Pay" : "40대",
		"age30Pay" : "30대",
		"age20Pay" : "20대",
		"age10Pay" : "10대"
	}
	
	//object -> array 변환
	const ageSortable = [];
	for (let key in agePay) {
		ageSortable.push([key, agePay[key]]);
	}

	//내림차순 정렬
	ageSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = ageSortable[0]
	
	let age = ageObj[key]
	return {
		age : age,
		pay : value
	}
}


//best매출 성별
function getGenderBestPay(genderPay){
	
	const genderObj = {
		"fSalesPay" : "여성",
		"mSalesPay" : "남성"
	}
	
	//object -> array 변환
	const genderSortable = [];
	for (let key in genderPay) {
		genderSortable.push([key, genderPay[key]]);
	}

	//내림차순 정렬
	genderSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = genderSortable[0]
	
	let gender = genderObj[key]
	return {
		gender : gender,
		pay : value
	}
}


//best매출 요일
function getWeekBestPay(weekPay){
	
	const weekObj = {
		"monSalesPay" : "월요일",
		"tueSalesPay" : "화요일",
		"wedSalesPay" : "수요일",
		"thurSalesPay" : "목요일",
		"friSalesPay" : "금요일",
		"satSalesPay" : "토요일",
		"sunSalesPay" : "일요일",
	}
	
	//object -> array 변환
	const weekSortable = [];
	for (let key in weekPay) {
		weekSortable.push([key, weekPay[key]]);
	}

	//내림차순 정렬
	weekSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = weekSortable[0]
	
	let week = weekObj[key]
	return {
		week : week,
		pay : value
	}
}

//best매출 시간대
function getTimeBestPay(timePay){
	
	const timeObj = {
		"time0006Pay" : "00 ~ 06시",
		"time0611Pay" : "06 ~ 11시",
		"time1114Pay" : "11 ~ 14시",
		"time1417Pay" : "14 ~ 17시",
		"time1721Pay" : "17 ~ 21시",
		"time2124Pay" : "21 ~ 24시",
	}
	
	//object -> array 변환
	const timeSortable = [];
	for (let key in timePay) {
		timeSortable.push([key, timePay[key]]);
	}

	//내림차순 정렬
	timeSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = timeSortable[0]
	
	let time = timeObj[key]
	return {
		time : time,
		pay : value
	}
}

//best매출 업종
function getServiceBestPay(servicePayArray){
	
	const serviceObj = {
		"CS1" : "외식업",
		"CS2" : "서비스업",
		"CS3" : "소매업"
	}
	
	//object -> array 변환
	const servicePayObj = {};
	for (let i = 0; i < servicePayArray.length; i ++) {
		servicePayObj[servicePayArray[i]["serviceCode"]] = servicePayArray[i]["fSalesPay"] + servicePayArray[i]["mSalesPay"]
	}
	
	
	const serviceSortable = [];
	for (let key in servicePayObj) {
			serviceSortable.push([key, servicePayObj[key]]);
	}

	//내림차순 정렬
	serviceSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = serviceSortable[0]
	
	let service = serviceObj[key]
	return {
		service : service,
		pay : value
	}
}



//best 유동인구

//best 유동인구 성별
function getGenderMove(genderMove){
	
	const genderMoveObj = {
		"fMove" : "여성",
		"mMove" : "남성"
	}
	
	//object -> array 변환
	const genderMoveSortable = [];
	
	genderMoveSortable.push(["fMove", genderMove["fMove"]]);
	genderMoveSortable.push(["mMove", genderMove["mMove"]]);
	
	//내림차순 정렬
	genderMoveSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = genderMoveSortable[0]
	
	let gender = genderMoveObj[key]
	return {
		genderMove : gender,
		pay : value
	}
}

//best 유동인구 연령대
function getAgeMove(ageMove){
	
	const ageMoveObj = {
		"age10Move" : "10대",
		"age20Move" : "20대",
		"age30Move" : "30대",
		"age40Move" : "40대",
		"age50Move" : "50대",
		"age60Move" : "60대"
	}
	
	//object -> array 변환
	const ageMoveSortable = [];
	
	ageMoveSortable.push(["age10Move", ageMove["age10Move"]]);
	ageMoveSortable.push(["age20Move", ageMove["age20Move"]]);
	ageMoveSortable.push(["age30Move", ageMove["age30Move"]]);
	ageMoveSortable.push(["age40Move", ageMove["age40Move"]]);
	ageMoveSortable.push(["age50Move", ageMove["age50Move"]]);
	ageMoveSortable.push(["age60Move", ageMove["age60Move"]]);
	
	//내림차순 정렬
	ageMoveSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = ageMoveSortable[0]
	
	let age = ageMoveObj[key]
	return {
		ageMove : age,
		pay : value
	}
}


//best 유동인구 요일
function getWeekBestMove(WeekBestMove){
	
	const WeekBestMoveObj = {
		"monMove" : "월요일",
		"tueMove" : "화요일",
		"wedMove" : "수요일",
		"thurMove" : "목요일",
		"friMove" : "금요일",
		"satMove" : "토요일",
		"sunMove" : "일요일",
	}
	
	//object -> array 변환
	const WeekBestMoveSortable = [];
	for (let key in WeekBestMove) {
		WeekBestMoveSortable.push([key, WeekBestMove[key]]);
	}

	//내림차순 정렬
	WeekBestMoveSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = WeekBestMoveSortable[0]
	
	let WeekMove = WeekBestMoveObj[key]
	return {
		WeekMove : WeekMove,
		pay : value
	}
}

//best 시간대 요일
function getTimeBestMove(TimeBestMove){
	
	const TimeBestMoveObj = {
		"time0006Move" : "00 ~ 06시",
		"time0611Move" : "06 ~ 11시",
		"time1114Move" : "11 ~ 14시",
		"time1417Move" : "14 ~ 17시",
		"time1721Move" : "17 ~ 21시",
		"time2124Move" : "21 ~ 24시"
	}
	
	//object -> array 변환
	const TimeBestMoveSortable = [];
	for (let key in TimeBestMove) {
		TimeBestMoveSortable.push([key, TimeBestMove[key]]);
	}

	//내림차순 정렬
	TimeBestMoveSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = TimeBestMoveSortable[0]
	
	let TimeMove = TimeBestMoveObj[key]
	return {
		TimeMove : TimeMove,
		pay : value
	}
}



//best 거주인구 성별
function getGenderLive(genderLive){
	
	const genderLiveObj = {
		"fLive" : "여성",
		"mLive" : "남성"
	}
	
	//object -> array 변환
	const genderLiveSortable = [];
	
	genderLiveSortable.push(["fLive", genderLive["fLive"]]);
	genderLiveSortable.push(["mLive", genderLive["mLive"]]);
	
	//내림차순 정렬
	genderLiveSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = genderLiveSortable[0]
	
	let gender = genderLiveObj[key]
	return {
		genderLive : gender,
		pay : value
	}
}

//best 거주인구 연령대
function getAgeLive(ageLive){
	
	const ageLiveObj = {
		"age10Live" : "10대",
		"age20Live" : "20대",
		"age30Live" : "30대",
		"age40Live" : "40대",
		"age50Live" : "50대",
		"age60Live" : "60대"
	}
	
	//object -> array 변환
	const ageLiveSortable = [];
	
	ageLiveSortable.push(["age10Live", ageLive["age10Live"]]);
	ageLiveSortable.push(["age20Live", ageLive["age20Live"]]);
	ageLiveSortable.push(["age30Live", ageLive["age30Live"]]);
	ageLiveSortable.push(["age40Live", ageLive["age40Live"]]);
	ageLiveSortable.push(["age50Live", ageLive["age50Live"]]);
	ageLiveSortable.push(["age60Live", ageLive["age60Live"]]);
	
	//내림차순 정렬
	ageLiveSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = ageLiveSortable[0]
	
	let age = ageLiveObj[key]
	return {
		ageLive : age,
		pay : value
	}
}


//best 직장인 성별
function getGenderCompany(genderCompany){
	
	const genderCompanyObj = {
		"fCompany" : "여성",
		"mCompany" : "남성"
	}
	
	//object -> array 변환
	const genderCompanySortable = [];
	
	genderCompanySortable.push(["fCompany", genderCompany["fCompany"]]);
	genderCompanySortable.push(["mCompany", genderCompany["mCompany"]]);
	
	//내림차순 정렬
	genderCompanySortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = genderCompanySortable[0]
	
	let gender = genderCompanyObj[key]
	return {
		genderCompany : gender,
		pay : value
	}
}

//best 직장인 연령대
function getAgeCompany(ageCompany){
	
	const ageCompanyObj = {
		"age10Company" : "10대",
		"age20Company" : "20대",
		"age30Company" : "30대",
		"age40Company" : "40대",
		"age50Company" : "50대",
		"age60Company" : "60대"
	}
	
	//object -> array 변환
	const ageCompanySortable = [];
	
	ageCompanySortable.push(["age10Company", ageCompany["age10Company"]]);
	ageCompanySortable.push(["age20Company", ageCompany["age20Company"]]);
	ageCompanySortable.push(["age30Company", ageCompany["age30Company"]]);
	ageCompanySortable.push(["age40Company", ageCompany["age40Company"]]);
	ageCompanySortable.push(["age50Company", ageCompany["age50Company"]]);
	ageCompanySortable.push(["age60Company", ageCompany["age60Company"]]);
	
	//내림차순 정렬
	ageCompanySortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = ageCompanySortable[0]
	
	let age = ageCompanyObj[key]
	return {
		ageCompany : age,
		pay : value
	}
}

//주요 집객시설 개수 순위
function getMainLocal(mainLocal){
	
	const mainLocalObj = {
		"bank" : "은행",
		"department" : "백화점",
		"market" : "마트",
		"publicOffice" : "공공기관",
		"schooll" : "학교",
		"stay" : "숙박시설",
		"theater" : "극장",
		"transportation" : "교통시설",
		"hospital" : "병원"
	}
	
	//object -> array 변환
	const mainLocalSortable = [];
	for (let key in mainLocal) {
		mainLocalSortable.push([key, mainLocal[key]]);
	}

	//내림차순 정렬
	mainLocalSortable.sort(function(a, b) {
		  return b[1] - a[1];
	});
	
	//가장 높은 value를 가지는 배열 꺼내오기
	//구조분해할당으로 key, value 분할
	let [key, value] = mainLocalSortable[0]
	
	let main = mainLocalObj[key]
	return {
		mainLocal : main,
		pay : value
	}
}