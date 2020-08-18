import 'package:flutter/material.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';

class Payment extends StatelessWidget {
  List Payment_info;
  Payment({Key key, @required this.Payment_info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp66647766',
      /* [필수입력] 결제 데이터 */
      data: PaymentData.fromJson({
        'pg': 'kakaotalk',                                          // PG사
        'payMethod': 'card',                                           // 결제수단
        'name': Payment_info[3],                                  // 주문명
        'merchantUid': 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        'amount': Payment_info[5],                                               // 결제금액
        'buyerName': '${Payment_info[0]}',                                           // 구매자 이름
        'buyerTel': Payment_info[1],                                     // 구매자 연락처
        'buyerEmail': Payment_info[2],                             // 구매자 이메일
        'buyerAddr': '서울시 강남구 신사동 661-16',                         // 구매자 주소
        'buyerPostcode': '06018',                                      // 구매자 우편번호
        'appScheme': 'example',                                        // 앱 URL scheme
        'display' : {
          'cardQuota' : [2,3]                                            //결제창 UI 내 할부개월수 제한
        },
        'custom_data' : '123'
      }),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        Navigator.pop(context);
      },
    );
  }
}