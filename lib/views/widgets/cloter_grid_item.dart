part of 'widgets.dart';

class CloterGridItem extends StatelessWidget {
  final CloterData cloter;
  final String memberToken;

  const CloterGridItem({Key key, this.cloter, this.memberToken}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  context.bloc<CdetailBloc>().add(LoadCDetail(cloter.slug, memberToken));
                  context.bloc<PageBloc>().add(GoToCdetail(memberToken,
                      slug: cloter.slug,
                      cloterData: cloter));
                },
                child: Container(
                  height: 250,
                  width: 150,
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
                      if (cloter.foto != null)
                        ClipPath.shape(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          child: Image.network(
                            cloter.foto,
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
                          cloter.nama,
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
                          cloter.angsuran ?? "-",
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
                              "Kuota : ${cloter.kuota}",
                              style: regular.copyWith(fontSize: 12),
                            ),
                            Text(
                              cloter.private
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
                          cloter.namaOwner ?? "-",
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
                          cloter.namaProvinsi ?? "-",
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
            );
  }
}