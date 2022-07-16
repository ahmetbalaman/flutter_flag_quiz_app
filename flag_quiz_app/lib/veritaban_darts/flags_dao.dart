import 'package:flag_quiz_app/veritaban_darts/flag_models.dart';
import 'package:flag_quiz_app/veritaban_darts/database_helper.dart';

class FlagDAO {
  Future<List<Flags>> randomFlag5Show() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM flags ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Flags(row["flag_id"], row["flag_name"], row["flag_photo"]);
    });
  }
  Future<List<Flags>> randomWrongFlag3Show(int flag_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
    await db.rawQuery("SELECT * FROM flags WHERE flag_id!=$flag_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Flags(row["flag_id"], row["flag_name"], row["flag_photo"]);
    });
  }
}
