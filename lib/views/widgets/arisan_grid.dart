part of 'widgets.dart';

class ArisanGrid extends StatelessWidget {
  final CloterResult cloterResult;
  final String memberToken;

  const ArisanGrid({Key key, this.cloterResult, this.memberToken}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GridView(
      padding: EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              (screenWidth / screenHeight) <= 2 ? 150 / 210 : 150 / 250,
          mainAxisSpacing: 5),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        if (cloterResult == null || cloterResult.status == false)
          Container()
        else
          for (var index = 0; index < cloterResult.data.length; index++)
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  context.bloc<CdetailBloc>().add(LoadCDetail(cloterResult.data[index].slug, memberToken));
                  context.bloc<PageBloc>().add(GoToCdetail(memberToken,
                      slug: cloterResult.data[index].slug,
                      cloterData: cloterResult.data[index]));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 4),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.71,
                      ),
                      if (cloterResult.data[index].foto != null)
                        ClipPath.shape(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          child: Image.network(
                            cloterResult.data[index].foto,
                            width: 137.14,
                            height: 128.13,
                            fit: BoxFit.cover,
                          ),
                        )
                      else
                        Image.asset(
                          "assets/images/profile_unfilled.png",
                          width: 137.14,
                          height: 128.13,
                          fit: BoxFit.cover,
                        ),
                      SizedBox(
                        height: 5.21,
                      ),
                      Container(
                        child: Text(
                          cloterResult.data[index].nama,
                          style: bold.copyWith(fontSize: 16),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        padding:
                            const EdgeInsets.only(left: 10.71, right: 10.71),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text(
                          cloterResult.data[index].angsuran ?? "-",
                          // "Rp 1.000.000",
                          style: bold.copyWith(
                              fontSize: 14, color: Color(0xFFA9010E)),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        padding:
                            const EdgeInsets.only(left: 10.71, right: 10.71),
                        width: double.infinity,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10.71, right: 9.64),
                        child: Row(
                          children: [
                            Text(
                              "Kuota : ${cloterResult.data[index].kuota}",
                              style: regular.copyWith(fontSize: 12),
                            ),
                            Text(
                              cloterResult.data[index].private
                                  ? "Private"
                                  : "Public",
                              style: regular.copyWith(fontSize: 12),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Container(
                        child: Text(
                          cloterResult.data[index].namaOwner ?? "-",
                          style: bold.copyWith(fontSize: 14),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        padding:
                            const EdgeInsets.only(left: 10.71, right: 10.71),
                        width: double.infinity,
                      ),
                      Container(
                        child: Text(
                          cloterResult.data[index].namaProvinsi ?? "-",
                          style: regular.copyWith(fontSize: 12),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        padding:
                            const EdgeInsets.only(left: 10.71, right: 10.71),
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            )
      ],
    );
  }
}
