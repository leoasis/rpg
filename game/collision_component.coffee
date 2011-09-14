class CollisionComponent
  collidesWith: (entity) ->
    @owner.position.isSameAs entity.position
    
exports.CollisionComponent = CollisionComponent