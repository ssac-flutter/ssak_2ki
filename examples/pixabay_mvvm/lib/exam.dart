
void main() {
  SuperHero superHero = SuperHero();
  Hero hero = SuperHero();
  Attack attack = SuperHero();
  Defence defence = SuperHero();

  final viewModel = ViewModel();

  viewModel.fight(superHero, defence as SuperHero);
}

class ViewModel {
  void fight(Attack attack, Defence defence) {

  }
}

class Hero {

}

class SuperHero extends Hero implements Attack, Defence {
  @override
  void kick() {
    // TODO: implement kick
  }

  @override
  void punch() {
    // TODO: implement punch
  }

  @override
  void downDefence() {
    // TODO: implement downDefence
  }

  @override
  void upDefence() {
    // TODO: implement upDefence
  }

}


abstract class Attack {
  void kick();
  void punch();
}

abstract class Defence {
  void upDefence();
  void downDefence();
}