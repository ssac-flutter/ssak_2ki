import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subway/data/result.dart';
import 'package:subway/data/subway_info_repository.dart';
import 'package:subway/model/subway_info.dart';
import 'package:subway/viewmodel/main_view_model.dart';

import 'main_view_model_test.mocks.dart';

@GenerateMocks([SubwayInfoRepository])
void main() {
  final fakeDatas = <SubwayInfo>[
    SubwayInfo(
      trainLineNm: 'trainLineNm',
      recptnDt: 'recptnDt',
      arvlMsg2: 'arvlMsg2',
      arvlMsg3: 'arvlMsg3',
      subwayHeading: 'subwayHeading',
    ),
    SubwayInfo(
      trainLineNm: 'test',
      recptnDt: 'test',
      arvlMsg2: 'test',
      arvlMsg3: 'test',
      subwayHeading: 'test',
    ),
  ];

  test('데이터', () async {
    final mockRepository = MockSubwayInfoRepository();
    final viewModel = MainViewModel(repository: mockRepository);

    // Mock을 이용하여 fetch 실행시 항상 동일한 결과 반환하도록 지정
    when(mockRepository.fetch('수원')).thenAnswer((realInvocation) async => Result.success(fakeDatas));

    await viewModel.fetch('수원');
    final result = viewModel.state.items;
    // 실행
    expect(result, fakeDatas);
    // 검증
    verify(mockRepository.fetch('수원'));


  });
}
