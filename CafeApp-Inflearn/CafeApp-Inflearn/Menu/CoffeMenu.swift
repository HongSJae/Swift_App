//
//  Menu.swift
//  CafeApp-Inflearn
//
//  Created by 홍승재 on 2022/07/08.
//

import Foundation

//커피메뉴
let Cnames: Array<String> = ["앗메리카노",
                            "원조커피",
                            "바닐라라떼",
                            "블랙펄 카페라떼",
                            "더블에스프레소",
                            "달달연유라떼",
                            "빽's 라떼",
                            "카페모카",
                            "카라멜마끼아또",
                            "크리미모카라떼",
                            "코코넛커피스무디",
                            "코코넛라떼"]
let Cprices: Array<NSString> = ["HOT : 1,500\nICED : 2,000",
                               "HOT : 2,000\nICED : 2,500",
                               "HOT : 3,000\nICED : 3,500",
                               "ICED : 3,500",
                               "HOT : 1,500",
                               "HOT : 2,500\nICED : 2,500",
                               "HOT : 2,500\nICED : 3,000",
                               "HOT : 3,000\nICED : 3,500",
                               "HOT : 3,000\nICED : 3,500",
                               "HOT : 3,800\nICED : 3,800",
                               "ICED : 4,000",
                               "ICED : 3,800"]
let Cimages: Array<String> = ["http://paikdabang.com/wp-content/uploads/2018/05/%EC%95%97%EB%A9%94%EB%A6%AC%EC%B9%B4%EB%85%B8-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EC%9B%90%EC%A1%B0%EC%BB%A4%ED%94%BC-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EB%B0%94%EB%8B%90%EB%9D%BC%EB%9D%BC%EB%96%BC-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2019/03/%EB%B8%94%EB%9E%99%ED%8E%84_%EC%B9%B4%ED%8E%98%EB%9D%BC%EB%96%BC.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EB%8D%94%EB%B8%94%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EC%97%B0%EC%9C%A0%EB%9D%BC%EB%96%BC-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EB%B0%B1%EC%8A%A4%EB%9D%BC%EB%96%BC-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EC%B9%B4%ED%8E%98%EB%AA%A8%EC%B9%B4-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EC%B9%B4%EB%9D%BC%EB%A9%9C%EB%A7%88%EB%81%BC%EC%95%84%EB%98%90-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%ED%81%AC%EB%A6%AC%EB%AF%B8%EB%AA%A8%EC%B9%B4%EB%9D%BC%EB%96%BC-2.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EC%BD%94%EC%BD%94%EB%84%9B%EC%BB%A4%ED%94%BC%EC%8A%A4%EB%AC%B4%EB%94%94-1.jpg",
     "http://paikdabang.com/wp-content/uploads/2018/05/%EC%BD%94%EC%BD%94%EB%84%9B%EB%9D%BC%EB%96%BC-1.jpg"]
let Cmessages: Array<String> = ["빽다방만의 맛과 향을 더한 100% 아라비카 로스팅 원두로 뽑아내 깊고 진한 맛의 앗!메리카노",
                               "시원달콤한 빽다방 대표메뉴, 믹스커피 종결자!",
                               "부드러운 우유와 달콤하고 은은한 바닐라가 조화를 이루는 음료",
                               "흑당 베이스의 풍미 있는 달콤함과 쫄깃한 타피오카 펄, 향긋한 에스프레소가 어우러진 블랙펄카페라떼",
                               "콜롬비아 원두를 베이스로 블랜딩한 커피의 본연의 향을 느낄 수 있는 에스프레소",
                               "달달하고 향긋한 베트남식 연유라떼",
                               "진한 에스프레소와 시원한 우유가 어우려져 탄생한 부드러운 빽다방 라떼",
                               "다크한 초콜렛과 진한 에스프레소, 부드러운 우유가 더해진 달콤한 맛의 커피",
                               "카라멜소스와 신선한 우유, 에스프레소로 맛을 낸 달콤한 빽다방 인기메뉴",
                               "깊고 진한 커피, 달콤한 초콜릿, 부드러운 크림의 환상 조합!",
                               "코코넛 젤리가 들어있는 달콤 고소한 코코넛커피스무디!",
                               "구운코코넛이 씹혀 더욱 고소한 코코넛라떼!"]
