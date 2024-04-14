import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "Procedures" field.
  List<String>? _procedures;
  List<String> get procedures => _procedures ?? const [];
  bool hasProcedures() => _procedures != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Is_Favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "Last_Accessed" field.
  DateTime? _lastAccessed;
  DateTime? get lastAccessed => _lastAccessed;
  bool hasLastAccessed() => _lastAccessed != null;

  // "Recipe_Type" field.
  String? _recipeType;
  String get recipeType => _recipeType ?? '';
  bool hasRecipeType() => _recipeType != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _ingredients = getDataList(snapshotData['Ingredients']);
    _procedures = getDataList(snapshotData['Procedures']);
    _image = snapshotData['Image'] as String?;
    _isFavorite = snapshotData['Is_Favorite'] as bool?;
    _lastAccessed = snapshotData['Last_Accessed'] as DateTime?;
    _recipeType = snapshotData['Recipe_Type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? name,
  String? description,
  String? image,
  bool? isFavorite,
  DateTime? lastAccessed,
  String? recipeType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
      'Image': image,
      'Is_Favorite': isFavorite,
      'Last_Accessed': lastAccessed,
      'Recipe_Type': recipeType,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        listEquality.equals(e1?.procedures, e2?.procedures) &&
        e1?.image == e2?.image &&
        e1?.isFavorite == e2?.isFavorite &&
        e1?.lastAccessed == e2?.lastAccessed &&
        e1?.recipeType == e2?.recipeType;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.ingredients,
        e?.procedures,
        e?.image,
        e?.isFavorite,
        e?.lastAccessed,
        e?.recipeType
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
