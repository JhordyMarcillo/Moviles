import '../entities/producto_entity.dart';
import '../../data/repositories/base_repository.dart';

class DeleteProductosUsecase{
  final BaseRepository repository;

  DeleteProductosUsecase(this.repository);

  Future<bool> call(String id){
    return repository.deleteProducts(id);
  }
}