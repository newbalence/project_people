let allStore = storeListJson[storeListJson.length - 1].similarStore
console.log(storeListJson)

/* 업종 보고서 그래프 */
	function drowStoreLine(){
		
		let storeBarlabels = [];
		let storeBardatas = [];

		for(let i = 0; i < storeListJson.length; i ++){
			storeBarlabels.push(storeListJson[i].yearCode)
			storeBardatas.push(storeListJson[i].similarStore)
		}
		const storebardata = {
	      labels: storeBarlabels,
	      datasets: [{
	        data: storeBardatas,
			label: "분기 점포 수",
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		let storeBarChart = document.getElementById('storeBarChart').getContext('2d');
		new Chart(storeBarChart, {
		    type: 'bar',
		    data : storebardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 점포 수'
					},
					legend: {
						display : false
					}
				}
			}
		})
	}
	
	function drowStorePie(){
		let storePieLabels = ["store", "Franchise_store"];
		let storePieDatas = [];
		for(let i = storeListJson.length - 1; i < storeListJson.length; i ++){
			storePieDatas.push(storeListJson[i].store)
			storePieDatas.push(storeListJson[i].franchiseStore)
		}
		const storePiedata = {
		  labels: storePieLabels,
		  datasets: [{
		    data: storePieDatas,
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 205, 86)'
		    ],
		  }],
		};
        
        let storePieChart = document.getElementById('storePieChart').getContext('2d');
        new Chart(storePieChart, {
            type: 'pie',
            data : storePiedata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '프렌차이즈와 일반 점포수 비교'
					},
					legend: {
						display : false
					}
				}
			}
        })
    }
	
	function drowStoreMeanOpen(){
		
		let meanOpenBarLabels = [];
		let meanOpenBarDatas = [];

		for(let i = 0; i < meanOpenListJson.length; i ++){
			meanOpenBarLabels.push(meanOpenListJson[i].yearCode)
			meanOpenBarDatas.push(meanOpenListJson[i].openMonthMean)
		}
		const meanOpenBardata = {
	      labels: meanOpenBarLabels,
	      datasets: [{
			label: "월평균 영업기간",
	        data: meanOpenBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		let meanOpenBarChart = document.getElementById('meanOpenBar').getContext('2d');
		new Chart(meanOpenBarChart, {
		    type: 'bar',
		    data : meanOpenBardata,
			options:{
					responsive: false,
					interaction: {
					  mode: 'index',
					  intersect: false,
					},
					stacked: false,
					plugins: {
						title: {
							display: true,
							text: '분기별 월 평균 영업 기간'
						},
						legend: {
							display : false
						}
					}
				}
		})
	}
	
	function drowStoreOpenBar(){
			
		let storeOpenBarLabels = [];
		let storeOpenBarDatas = [];

		for(let i = 0; i < storeOpenListJson.length; i ++){
			storeOpenBarLabels.push(storeOpenListJson[i].yearCode)
			storeOpenBarDatas.push(storeOpenListJson[i].openStore)
		}
		const storeOpenBardata = {
	      labels: storeOpenBarLabels,
	      datasets: [{
			label: "총 개업 수",
	        data: storeOpenBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		let storeOpenBarChart = document.getElementById('storeOpenBar').getContext('2d');
		new Chart(storeOpenBarChart, {
		    type: 'bar',
		    data : storeOpenBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 총 개업 수'
					},
					legend: {
						display : false
					}
				}
			}
		})
	}
	
	function drowStoreCloseBar(){
		let StoreCloseBarLabels = [];
	    let StoreCloseBarDatas = [];
	    
	    for(let i = 0; i < storeCloseListJson.length; i ++){
	    	StoreCloseBarLabels.push(storeCloseListJson[i].yearCode)
	    	StoreCloseBarDatas.push(storeCloseListJson[i].closeStore)
	    }
	    const storeCloseBardata = {
	      labels: StoreCloseBarLabels,
	      datasets: [{
	        label: '총 폐업 수',
	        data: StoreCloseBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let storeCloseBarChart = document.getElementById('storeCloseBar').getContext('2d');
	    new Chart(storeCloseBarChart, {
	        type: 'bar',
	        data : storeCloseBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 총 폐업 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowStoreServicePie(){
		let storeServiceLabels = ["외식업", "서비스업", "소매업"];
		let storeServiceDatas = [];
		
		for(let i = 0; i < storeServiceListJson.length; i ++){
			storeServiceDatas.push(storeServiceListJson[i].store)
		}
		const storeServicePiedata = {
		  labels: storeServiceLabels,
		  datasets: [{
		    data: storeServiceDatas,
		    backgroundColor: [
		      'rgb(255, 99, 132)',
		      'rgb(54, 162, 235)',
		      'rgb(255, 205, 86)'
		    ],
		  }],
		};
        
        let storeServicePieChart = document.getElementById('storeServicePie').getContext('2d');
        new Chart(storeServicePieChart, {
            type: 'pie',
            data : storeServicePiedata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '업종별 가게 수'
					},
					legend: {
						display : false
					}
				}
			}
        })
    }
	
	function drowStoreServiceHalfBar(){
		let StoreServiceHalfBarCodeLabels  = ["외식업", "서비스업", "소매업", "외식업", "서비스업", "소매업", "외식업", "서비스업", "소매업", "외식업", "서비스업", "소매업", "외식업", "서비스업", "소매업"]
		let StoreServiceHalfBarLabels = [];
	    let StoreServiceHalfBarDatas = [];
	    
	    for(let i = 0; i < storeServiceHalfJson.length; i ++){
	    	StoreServiceHalfBarLabels.push(storeServiceHalfJson[i].yearCode + StoreServiceHalfBarCodeLabels[i])
	    	StoreServiceHalfBarDatas.push(storeServiceHalfJson[i].store)
	    }
		
		let StoreServiceHalf = [20234, 20241, 20242, 20243, 20244]
		
		let CS1SSHBData = []
		let CS2SSHBData = []
		let CS3SSHBData = []

		for(let i = 0; i < storeServiceHalfJson.length; i+=3){
			CS1SSHBData.push(storeServiceHalfJson[i].store)
		}

		for(let i = 1; i < storeServiceHalfJson.length; i+=3){
			CS2SSHBData.push(storeServiceHalfJson[i].store)
		}

		for(let i = 2; i < storeServiceHalfJson.length; i+=3){
			CS3SSHBData.push(storeServiceHalfJson[i].store)
		}
		
	    const StoreServiceHalfBardata = {
	      labels: StoreServiceHalf,
		  datasets: [{
				label: "외식업",
				data: CS1SSHBData,
			},{
				label: "서비스업",
				data: CS2SSHBData,
			},{
				label: "소매업",
				data: CS3SSHBData,
			}]
		};
		
		let StoreServiceHalfBarChart = document.getElementById('storeServiceBar').getContext('2d');
	    new Chart(StoreServiceHalfBarChart, {
	        type: 'bar',
	        data : StoreServiceHalfBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 업종 분포 추이'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
/* 매출액 보고서 그래프 */
	function drowstoreMeanPayLine(){ 
	    let drowstoreMeanPayLinelabels =[]
	    let drowstoreMeanPayLineData = []
		
		for(let i = 0; i < storeMeanPayJson.length; i ++){
			drowstoreMeanPayLinelabels.push(storeMeanPayJson[i].yearCode)
			drowstoreMeanPayLineData.push(storeMeanPayJson[i].monthSalesPay / 10000 / 3)
		}
	    
		const drowstoreMeanPayLinedata = {
	      labels: drowstoreMeanPayLinelabels,
	      datasets: [{
	        label: '월평균 매출액',
	        data: drowstoreMeanPayLineData,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
	    
	    
	    let drowstoreMeanPayLineChart = document.getElementById('storeMeanPayLine').getContext('2d');
		new Chart(drowstoreMeanPayLineChart, {
	        type: 'line',
	        data : drowstoreMeanPayLinedata,
			options: {
			    responsive: false,
			    interaction: {
			      mode: 'index',
			      intersect: false,
			    },
			    stacked: false,
			    plugins: {
					title: {
						display: true,
						text: '점포당 월평균 매출액'
					},
					legend: {
			    		display : false
			    	}
				}
			}
	    })
    }
	
	function drowstoreMeanNumLine(){ 
	    let drowstoreMeanPayNumlabels =[]
	    let drowstoreMeanPayNumData = []
		
		for(let i = 0; i < storeMeanNumJson.length; i ++){
			drowstoreMeanPayNumlabels.push(storeMeanNumJson[i].yearCode)
			drowstoreMeanPayNumData.push(storeMeanNumJson[i].monthSalesNum)
		}
		
/*		let CS1SMNData = []
		let CS2SMNData = []
		let CS3SMNData = []
		
		for(let i = 0; i < storeMeanNumJson.length; i+=3){
			CS1SMNData.push(storeMeanNumJson[i].store)
		}
		
		for(let i = 1; i < storeMeanNumJson.length; i+=3){
			CS2SMNData.push(storeMeanNumJson[i].store)
		}
		
		for(let i = 2; i < storeMeanNumJson.length; i+=3){
			CS3SMNData.push(storeMeanNumJsons[i].store)
		}
		
		let drowstoreMeanNum = [20234, 20241, 20242, 20243, 20244]*/
	    
		const drowstoreMeanNumLinedata = {
			      labels: drowstoreMeanPayNumlabels,
			      datasets: [{
			        label: '분기 평균 매출 건수',
			        data: drowstoreMeanPayNumData,
			        backgroundColor: [
			          'rgba(255, 99, 132, 0.2)',
			          'rgba(255, 159, 64, 0.2)',
			          'rgba(255, 205, 86, 0.2)',
			          'rgba(75, 192, 192, 0.2)',
			          'rgba(54, 162, 235, 0.2)',
			          'rgba(153, 102, 255, 0.2)',
			          'rgba(201, 203, 207, 0.2)'
			        ],
			        borderColor: [
			          'rgb(255, 99, 132)',
			          'rgb(255, 159, 64)',
			          'rgb(255, 205, 86)',
			          'rgb(75, 192, 192)',
			          'rgb(54, 162, 235)',
			          'rgb(153, 102, 255)',
			          'rgb(201, 203, 207)'
			        ],
			        borderWidth: 1
			      }]
			    };
	    
	    let drowstoreMeanNumLineChart = document.getElementById('storeMeanNumLine').getContext('2d');
		new Chart(drowstoreMeanNumLineChart, {
	        type: 'line',
	        data : drowstoreMeanNumLinedata,
			options: {
			    responsive: false,
			    interaction: {
			      mode: 'index',
			      intersect: false,
			    },
			    stacked: false,
			    plugins: {
					title: {
						display: true,
						text: '점포당 평균 매출 건수'
					},
					legend: {
			    		display : false
			    	}
				}
			}
	    })
}
	
	function drowWeekPayBar(){
		let drowWeekPayBarLabels = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"];
	    let drowWeekPayBarDatas = [
			weekPayJson.monSalesPay / 10000,
			weekPayJson.tueSalesPay / 10000,
			weekPayJson.wedSalesPay / 10000,
			weekPayJson.thurSalesPay / 10000,
			weekPayJson.friSalesPay / 10000,
			weekPayJson.satSalesPay / 10000,
			weekPayJson.sunSalesPay / 10000
		];
	    
	    const drowWeekPayBardata = {
	      labels: drowWeekPayBarLabels,
	      datasets: [{
	        label: '매출',
	        data: drowWeekPayBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let drowWeekPayBarChart = document.getElementById('weekPayBar').getContext('2d');
	    new Chart(drowWeekPayBarChart, {
	        type: 'bar',
	        data : drowWeekPayBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '요일별 매출 현황'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowTimePayLine(){
		let TimePayLineLabels = [
			"00 ~ 06시", "06 ~ 11시", 
			"11 ~ 14시", "14 ~ 17시", 
			"17 ~ 21시", "21 ~ 24시"
		]
	    let TimePayLineDatas =[
	    	timePayJson.time0006Pay / 10000, 
	    	timePayJson.time0611Pay / 10000,
			timePayJson.time1114Pay / 10000,
	   		timePayJson.time1417Pay / 10000,
	   		timePayJson.time1721Pay / 10000,
	   		timePayJson.time2124Pay / 10000
	    ] 
	    
	    
	    const TimePayLinedata = {
				labels: TimePayLineLabels,
				datasets : [{
					data : TimePayLineDatas
				}],
				fill: false,
				type: 'line',
				backgroundColor: [
					'rgb(255, 99, 132)'
				],
				hoverOffset: 30,
				tension: 0.5
	    	};
	    
	    let TimePayLineChart = document.getElementById('timePayLine').getContext('2d');
	    new Chart(TimePayLineChart, {
	        type: 'line',
	        data : TimePayLinedata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '시간별 매출액'
					},
					legend: {
						display : false
					}
				}
			}
	    })
    }
	
	function drowGenderPayPie(){
		let GenderPayPieLabels = ["Female", "Male"]
        
        //Json.parse()
        let GenderPayPieDatas = [
			genderPayJson.fSalesPay / 10000, 
			genderPayJson.mSalesPay / 10000
		]
		
        const GenderPayPiedata = {
        		  labels: GenderPayPieLabels,
        		  datasets: [{
        		    data: GenderPayPieDatas,
        		    backgroundColor: [
        		      'rgb(255, 99, 132)',
        		      'rgb(54, 162, 235)',
        		      'rgb(255, 205, 86)'
        		    ],
        		  }],
        		};
        
        let GenderPayPieChart = document.getElementById('genderPayPie').getContext('2d');
        new Chart(GenderPayPieChart, {
            type: 'pie',
            data : GenderPayPiedata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '성별 매출 현황'
					},
					legend: {
						display : false
					}
				}
			}
        })
    }
	
	function drowServiceGenderPie(){
			let ServiceGenderPieLabels = ["Female", "Male"]
			
			let ServiceGenderPieLabel = ["외식업", "서비스업", "소매업"]
	        
			let CS1GPPData = [serviceGenderPayJson[0].fSalesPay / 10000, serviceGenderPayJson[0].mSalesPay / 10000]
			let CS2GPPData = [serviceGenderPayJson[1].fSalesPay / 10000, serviceGenderPayJson[1].mSalesPay / 10000]
			let CS3GPPData = [serviceGenderPayJson[2].fSalesPay / 10000, serviceGenderPayJson[2].mSalesPay / 10000]
			
			let ServiceGenderPieDatas = [
				CS1GPPData,
				CS2GPPData,
				CS3GPPData
			]
	        
			for(let i = 0; i < 3; i ++){
		        let ServiceGenderPieChart = document.getElementById('CS'+ (i+1) + 'GenderPie').getContext('2d');
		        new Chart(ServiceGenderPieChart, {
		            type: 'pie',
		            data : {
						labels: ServiceGenderPieLabels,
						datasets: [{
							label : ServiceGenderPieLabel[i],
							data : ServiceGenderPieDatas[i]
						}]
					},
					options:{
						responsive: false,
						interaction: {
						  mode: 'index',
						  intersect: false,
						},
						stacked: false,
						plugins: {
							title: {
								display: true,
								text: '성별 CS' + (i + 1) + '매출 현황'
							},
							legend: {
								display : false
							}
						}
					}
		        })
			}
	    }
	
	function drowAgePayBar(){
		let AgePayBarLabels = ["10대", "20대", "30대", "40대", "50대", "60대"];
	    let AgePayBarDatas = [
			agePayJson.age10Pay,
			agePayJson.age20Pay,
			agePayJson.age30Pay,
			agePayJson.age40Pay,
			agePayJson.age50Pay,
			agePayJson.age60Pay
		];
	    
	    const AgePayBardata = {
	      labels: AgePayBarLabels,
	      datasets: [{
	        label: '매출',
	        data: AgePayBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AgePayBarChart = document.getElementById('agePayBar').getContext('2d');
	    new Chart(AgePayBarChart, {
	        type: 'bar',
	        data : AgePayBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '연령대별 매출 현황'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowServiceAgePie(){
		let ServiceAgePieLabels =  ["10대", "20대", "30대", "40대", "50대", "60대"]
		
		let ServiceAgePieLabel = ["외식업", "서비스업", "소매업"]
        
		let CS1SAPData = [
			serviceAgePayJson[0].age10Pay / 10000, serviceAgePayJson[0].age20Pay / 10000, 
			serviceAgePayJson[0].age30Pay / 10000, serviceAgePayJson[0].age40Pay / 10000, 
			serviceAgePayJson[0].age50Pay / 10000, serviceAgePayJson[0].age60Pay / 10000
		]
		let CS2SAPData = [
			serviceAgePayJson[1].age10Pay / 10000, serviceAgePayJson[1].age20Pay / 10000, 
			serviceAgePayJson[1].age30Pay / 10000, serviceAgePayJson[1].age40Pay / 10000, 
			serviceAgePayJson[1].age50Pay / 10000, serviceAgePayJson[1].age60Pay / 10000
		]
		let CS3SAPData = [
			serviceAgePayJson[2].age10Pay / 10000, serviceAgePayJson[2].age20Pay / 10000, 
			serviceAgePayJson[2].age30Pay / 10000, serviceAgePayJson[2].age40Pay / 10000, 
			serviceAgePayJson[2].age50Pay / 10000, serviceAgePayJson[2].age60Pay / 10000
		]
		
		let ServiceAgePieDatas = [
			CS1SAPData,
			CS2SAPData,
			CS3SAPData
		]
        
		for(let i = 0; i < 3; i ++){
	        let ServiceAgePieChart = document.getElementById('CS'+ (i+1) + 'AgePie').getContext('2d');
	        new Chart(ServiceAgePieChart, {
	            type: 'bar',
	            data : {
					labels: ServiceAgePieLabels,
					datasets: [{
						label : ServiceAgePieLabel[i],
						data : ServiceAgePieDatas[i],
						backgroundColor: [
						  'rgba(255, 99, 132, 0.2)',
						  'rgba(255, 159, 64, 0.2)',
						  'rgba(255, 205, 86, 0.2)',
						  'rgba(75, 192, 192, 0.2)',
						  'rgba(54, 162, 235, 0.2)',
						  'rgba(153, 102, 255, 0.2)',
						  'rgba(201, 203, 207, 0.2)'
						],
						borderColor: [
						  'rgb(255, 99, 132)',
						  'rgb(255, 159, 64)',
						  'rgb(255, 205, 86)',
						  'rgb(75, 192, 192)',
						  'rgb(54, 162, 235)',
						  'rgb(153, 102, 255)',
						  'rgb(201, 203, 207)'
						],
						borderWidth: 1
					}]
				},
				options:{
					responsive: false,
					interaction: {
					  mode: 'index',
					  intersect: false,
					},
					stacked: false,
					plugins: {
						title: {
							display: true,
							text: '연령대별 CS' + (i + 1) + '매출 현황'
						},
						legend: {
							display : false
						}
					}
				}
	        })
		}
    }
	
/* 인구 */
	function drowAllMoveBar(){
		let AllMoveBarLabels = [];
	    let AllMoveBarDatas = [];
	    
		for(let i = 0; i < allMoveJson.length; i++){
			AllMoveBarLabels.push(allMoveJson[i].yearCode) 
			AllMoveBarDatas.push(allMoveJson[i].allMovePeople)
		}
		
	    const AllMoveBardata = {
	      labels: AllMoveBarLabels,
	      datasets: [{
	        label: '분기 유동인구',
	        data: AllMoveBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AllMoveBarChart = document.getElementById('allMoveBar').getContext('2d');
	    new Chart(AllMoveBarChart, {
	        type: 'bar',
	        data : AllMoveBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 유동 인구 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowGenderAgeMoveBar(){
		let GenderAgeMoveBarLabels = [
			"남자", "여자", "10대", "20대", 
			"30대", "40대", "50대", "60대"
		];
	    let GenderAgeMoveBarDatas = [
			genderAgeMoveJson.mMove, genderAgeMoveJson.fMove, 
			genderAgeMoveJson.age10Move, genderAgeMoveJson.age20Move,
			genderAgeMoveJson.age30Move, genderAgeMoveJson.age40Move, 
			genderAgeMoveJson.age50Move, genderAgeMoveJson.age60Move
		];
	   
		
	    const GenderAgeMoveBardata = {
	      labels: GenderAgeMoveBarLabels,
	      datasets: [{
	        data: GenderAgeMoveBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
			  'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
			  'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let GenderAgeMoveBarChart = document.getElementById('genderAgeMoveBar').getContext('2d');
	    new Chart(GenderAgeMoveBarChart, {
	        type: 'bar',
	        data : GenderAgeMoveBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '성별 & 나이별 유동 인구 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowDayMoveBar(){
		let DayMoveBarLabels = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"];
	    let DayMoveBarDatas = [
			dayMoveJson.monMove, dayMoveJson.tueMove, 
			dayMoveJson.wedMove, dayMoveJson.thurMove,
			dayMoveJson.friMove, dayMoveJson.satMove, 
			dayMoveJson.sunMove
		];
	   
		
	    const DayMoveBardata = {
	      labels: DayMoveBarLabels,
	      datasets: [{
	        label: '유동인구',
	        data: DayMoveBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
			  'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
			  'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let DayMoveBarChart = document.getElementById('dayMoveBar').getContext('2d');
	    new Chart(DayMoveBarChart, {
	        type: 'bar',
	        data : DayMoveBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '요일 별 총 유동 인구 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowTimeMoveLine(){
		let TimeMoveLineLabels = [
			"00 ~ 06시", "06 ~ 11시", 
			"11 ~ 14시", "14 ~ 17시", 
			"17 ~ 21시", "21 ~ 24시"
		]
	    let TimeMoveLineDatas =[
	    	timeMoveJson.time0006Move, 
	    	timeMoveJson.time0611Move,
			timeMoveJson.time1114Move,
	   		timeMoveJson.time1417Move,
	   		timeMoveJson.time1721Move,
	   		timeMoveJson.time2124Move
	    ] 
	    
	    
	    const TimeMoveLinedata = {
				labels: TimeMoveLineLabels,
				datasets : [{
					data : TimeMoveLineDatas
				}],
				fill: false,
				type: 'line',
				backgroundColor: [
					'rgb(255, 99, 132)'
				],
				hoverOffset: 30,
				tension: 0.5
	    	};
	    
	    let TimeMoveLineChart = document.getElementById('timeMoveLine').getContext('2d');
	    new Chart(TimeMoveLineChart, {
	        type: 'line',
	        data : TimeMoveLinedata,
			options: {
			    responsive: false,
			    interaction: {
			      mode: 'index',
			      intersect: false,
			    },
			    stacked: false,
			    plugins: {
					title: {
						display: true,
						text: '시간별 유동인구 수'
					},
					legend: {
			    		display : false
			    	}
				}
			}
	    })
    }
	
	function drowAllLiveBar(){
		let AllLiveBarLabels = [];
	    let AllLiveBarDatas = [];
	   
		for(let i = 0; i < allLiveJson.length; i++){
			AllLiveBarLabels.push(allLiveJson[i].yearCode)
			AllLiveBarDatas.push(allLiveJson[i].allLivePeople)
		}
		
	    const AllLiveBardata = {
	      labels: AllLiveBarLabels,
	      datasets: [{
	        label: '분기 상주인구',
	        data: AllLiveBarDatas,
	        backgroundColor: [
			  'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
			  'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AllLiveBarChart = document.getElementById('allLiveBar').getContext('2d');
	    new Chart(AllLiveBarChart, {
	        type: 'bar',
	        data : AllLiveBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 총 상주 인구 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}	
    
	function drowGenderAgeLiveBar(){
		let GenderAgeLiveBarLabels = [
			"남자", "여자", "10대", "20대", 
			"30대", "40대", "50대", "60대"
		];
	    let GenderAgeLiveBarDatas = [
			genderAgeLiveJson.mLive, genderAgeLiveJson.fLive, 
			genderAgeLiveJson.age10Live, genderAgeLiveJson.age20Live,
			genderAgeLiveJson.age30Live, genderAgeLiveJson.age40Live, 
			genderAgeLiveJson.age50Live, genderAgeLiveJson.age60Live
		];
	   
		
	    const GenderAgeLiveBardata = {
	      labels: GenderAgeLiveBarLabels,
	      datasets: [{
	        data: GenderAgeLiveBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
			  'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
			  'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let GenderAgeLiveBarChart = document.getElementById('genderAgeLiveBar').getContext('2d');
	    new Chart(GenderAgeLiveBarChart, {
	        type: 'bar',
	        data : GenderAgeLiveBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '성별 & 나이별 상주 인구 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowAllCompanyBar(){
		let AllCompanyBarLabels = [];
	    let AllCompanyBarDatas = [];
	    
		for(let i = 0; i < allCompanyJson.length; i++){
			AllCompanyBarLabels.push(allCompanyJson[i].yearCode) 
			AllCompanyBarDatas.push(allCompanyJson[i].allCompanyPeople)
		}
		
	    const AllCompanyBardata = {
	      labels: AllCompanyBarLabels,
	      datasets: [{
	        label: '직장인',
	        data: AllCompanyBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AllCompanyBarChart = document.getElementById('allCompanyBar').getContext('2d');
	    new Chart(AllCompanyBarChart, {
	        type: 'bar',
	        data : AllCompanyBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 총 직장인 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowGenderAgeCompanyBar(){
		let GenderAgeCompanyBarLabels = [
			"남자", "여자", "10대", "20대", 
			"30대", "40대", "50대", "60대"
		];
	    let GenderAgeCompanyBarDatas = [
			genderAgeCompanyJson.mCompany, genderAgeCompanyJson.fCompany, 
			genderAgeCompanyJson.age10Company, genderAgeCompanyJson.age20Company,
			genderAgeCompanyJson.age30Company, genderAgeCompanyJson.age40Company, 
			genderAgeCompanyJson.age50Company, genderAgeCompanyJson.age60Company
		];
	   
		
	    const GenderAgeCompanyBardata = {
	      labels: GenderAgeCompanyBarLabels,
	      datasets: [{
	        data: GenderAgeCompanyBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
			  'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
			  'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let GenderAgeCompanyBarChart = document.getElementById('genderAgeCompanyBar').getContext('2d');
	    new Chart(GenderAgeCompanyBarChart, {
	        type: 'bar',
	        data : GenderAgeCompanyBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '성별 & 나이별 직장인 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowAllFamilyBar(){
		let AllFamilyBarLabels = [];
	    let AllFamilyBarDatas = [];
	   
		for(let i = 0; i < allFamilyJson.length; i++){
			AllFamilyBarLabels.push(allFamilyJson[i].yearCode)
			AllFamilyBarDatas.push(allFamilyJson[i].allFamilyPeople)
		}
		
	    const AllFamilyBardata = {
	      labels: AllFamilyBarLabels,
	      datasets: [{
	        data: AllFamilyBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AllFamilyBarChart = document.getElementById('allFamilyLineBar').getContext('2d');
	    new Chart(AllFamilyBarChart, {
	        type: 'bar',
	        data : AllFamilyBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 총 가구 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowAllLocalBar(){
		let AllLocalBarLabels = [];
	    let AllLocalBarDatas = [];
	   
		for(let i = 0; i < allLocalJson.length; i++){
			AllLocalBarLabels.push(allLocalJson[i].yearCode)
			AllLocalBarDatas.push(allLocalJson[i].hospitalityFacilities)
		}
		
	    const AllLocalBardata = {
	      labels: AllLocalBarLabels,
	      datasets: [{
			label: '분기 집객 시설 수',
	        data: AllLocalBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AllLocalBarChart = document.getElementById('allLocalBar').getContext('2d');
	    new Chart(AllLocalBarChart, {
	        type: 'bar',
	        data : AllLocalBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 집객 시설 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowMainLocalBar(){
		let MainLocalBarLabels = [
			"공공기관", "은행", "병원","학교", 
			"백화점", "마트", "극장", "숙박시설", "교통시설"
		];
	    let MainLocalBarDatas = [
			mainLocalJson.publicOffice,
			mainLocalJson.bank,
			mainLocalJson.hospital,
			mainLocalJson.schooll,
			mainLocalJson.department,
			mainLocalJson.market,
			mainLocalJson.theater,
			mainLocalJson.stay,
			mainLocalJson.transportation
		];
		
	    const MainLocalBardata = {
	      labels: MainLocalBarLabels,
	      datasets: [{
			label: '분기 집객 시설 수',
	        data: MainLocalBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let MainLocalBarChart = document.getElementById('mainLocalBar').getContext('2d');
	    new Chart(MainLocalBarChart, {
	        type: 'bar',
	        data : MainLocalBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 집객 시설 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	function drowAllIncomeBar(){
		let AllIncomeBarLabels = [];
	    let AllIncomeBarDatas = [];
	   
		for(let i = 0; i < allIncomeJson.length; i++){
			AllIncomeBarLabels.push(allIncomeJson[i].yearCode)
			AllIncomeBarDatas.push(allIncomeJson[i].incomeCode)
		}
		
	    const AllIncomeBardata = {
	      labels: AllIncomeBarLabels,
	      datasets: [{
			label: '분기 집객 시설 수',
	        data: AllIncomeBarDatas,
	        backgroundColor: [
	          'rgba(255, 99, 132, 0.2)',
	          'rgba(255, 159, 64, 0.2)',
	          'rgba(255, 205, 86, 0.2)',
	          'rgba(75, 192, 192, 0.2)',
	          'rgba(54, 162, 235, 0.2)',
	          'rgba(153, 102, 255, 0.2)',
	          'rgba(201, 203, 207, 0.2)'
	        ],
	        borderColor: [
	          'rgb(255, 99, 132)',
	          'rgb(255, 159, 64)',
	          'rgb(255, 205, 86)',
	          'rgb(75, 192, 192)',
	          'rgb(54, 162, 235)',
	          'rgb(153, 102, 255)',
	          'rgb(201, 203, 207)'
	        ],
	        borderWidth: 1
	      }]
	    };
		
		let AllIncomeBarChart = document.getElementById('allIncomeBar').getContext('2d');
	    new Chart(AllIncomeBarChart, {
	        type: 'bar',
	        data : AllIncomeBardata,
			options:{
				responsive: false,
				interaction: {
				  mode: 'index',
				  intersect: false,
				},
				stacked: false,
				plugins: {
					title: {
						display: true,
						text: '분기별 집객 시설 수'
					},
					legend: {
						display : false
					}
				}
			}
	        
	    })
	}
	
	drowStoreLine()
	drowStorePie()
	drowStoreMeanOpen()
	drowStoreOpenBar()
	drowStoreCloseBar()
	drowStoreServicePie()
	drowStoreServiceHalfBar()
	
	drowstoreMeanPayLine()
	drowstoreMeanNumLine()
	drowWeekPayBar()
	drowTimePayLine()
	drowGenderPayPie()
	drowServiceGenderPie()
	drowAgePayBar()
	drowServiceAgePie()
	
	drowAllMoveBar()
	drowGenderAgeMoveBar()
	drowDayMoveBar()
	drowTimeMoveLine()
	drowAllLiveBar()
	drowGenderAgeLiveBar()
	drowAllCompanyBar()
	drowGenderAgeCompanyBar()
	drowAllFamilyBar()
	
	drowAllLocalBar()
	drowMainLocalBar()
	drowAllIncomeBar()
	
	
	
	
	
	
	
	
	
	
	
	