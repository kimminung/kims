
import Foundation

class Character {

    private var basicAttack: Int = 10   // 평타 공격력
    private var hp: Int = 100           // 생명력
    
    //평타 공격력 Getter, Setter
    var _basicAttack: Int {
        get {
            return self.basicAttack
        }
        
        set {
            self.basicAttack = newValue
        }
    }
    
    //생명력 Getter,Setter
    var _hp: Int {
        get {
            return self.hp
        }
        
        set {
            self.hp = newValue
        }
    }
    
    //살아있음을 체크
    var isAlive: Bool {
        get {
            return _hp <= 0 ? false : true
        }
    }
    
    //초기화
    init(basicAttack: Int, hp: Int ) {
        self._basicAttack = basicAttack
        self._hp = hp
    }
    
    ////////////////////////////////////////////
    //오버로딩 ( 오버로딩 쓸려고 일부로 이렇게 만들었어요 )
    
    //평타 공격(to: 공격대상)
    func basicAttack(to: Enemy) {
        print("<Wizard> 평타 공격!!!!!!!!")
        to.takeDamage(attackPower: _basicAttack)
    }
    
    func basicAttack(to: Wizard) {
        print("<Giant> 평타 공격!!!!!!!!")
        to.takeDamage(attackPower: _basicAttack)
    }
    
    //데미지를 입고 hp가 마이너스되는 메서드
    func takeDamage(attackPower: Int){
        self._hp -= attackPower
        print("\(attackPower)만큼 데미지를 입었습니다.")
        
        if(isAlive == true){
            print("현재 HP는 \(self._hp)입니다.")
            print("==================================")
        }else{
            print("플레이어가 사망했습니다.)")
        }
    }
}

class Wizard: Character {

    private var name: String    //Wizard의 플레이어 이름

    //이름 Getter, Setter
    var _name: String {
        get {
            return name
        }
        
        set {
            self.name = newValue
        }
    }

    //초기화
    init(name: String) {
        self.name = name
        
        //부모 init을 불러와서 초기화
        super.init(basicAttack: 10, hp: 100) // 기본 공격력 10, HP 100으로 초기화
    }
    
    // 오버라이딩
    override func takeDamage(attackPower: Int) {
        super._hp -= attackPower
        print("\(self.name)가 \(attackPower)만큼 데미지를 입었습니다.")
        
        if(isAlive == true){
            print("현재 \(self.name) HP는 \(self._hp)입니다.")
            print("==================================")
        }else{
            print("\(self.name)가 사망하였습니다.")
        }
    }
    
    //파이어볼(필살기)
    func fireballAttack(to: Enemy) {
        print("<Wizard> 파이어볼(필살기) 공격!!!!!!!!")
        to.takeDamage(attackPower: 30)
    }
    
}

class Enemy: Character {
    
    private var name: String    // 적 이름
    
    // 적 이름 Getter, Setter
    var _name: String {
        get {
            return self.name
        }
        
        set {
            self.name = newValue
        }
    }
    
    //초기화
    init(name: String) {
        self.name = name
        
        //부모 init을 불러와서 초기화
        super.init(basicAttack: 20, hp: 60) // 기본 공격력, HP 60으로 초기화
    }
    
    // 오버라이딩
    override func takeDamage(attackPower: Int) {
        super._hp -= attackPower
        print("\(self.name)가 \(attackPower)만큼 데미지를 입었습니다.")
        
        if(isAlive == true){
            print("현재 \(self.name) HP는 \(self._hp)입니다.")
            print("==================================")
        }else{
            print("\(self.name)가 죽었습니다.")
        }
    }
    
    //필살기
    func powerfulSwordDown(to: Wizard) {
        print("<Giant> 평타 공격!!!!!!!!")
        to.takeDamage(attackPower: 20)
    }
}

var wizardPlayer1: Wizard = Wizard(name: "김승진")
var giantEnemy: Enemy = Enemy (name: "Giant")

wizardPlayer1.basicAttack(to: giantEnemy)
giantEnemy.basicAttack(to: wizardPlayer1)

wizardPlayer1.fireballAttack(to: giantEnemy)
giantEnemy.powerfulSwordDown(to: wizardPlayer1)

wizardPlayer1.fireballAttack(to: giantEnemy)









