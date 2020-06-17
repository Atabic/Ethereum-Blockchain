pragma solidity >=0.4.21 <0.6.0;

contract Marketplace {
    string public name;
    uint public productCount = 0;
    mapping(uint=>Product) public products;

    struct Product{
        uint id;
        string name;
        uint price;
        address owner;
        bool purchased;

    }
    constructor() public {
        name = 'Dapp University Marketplace';
    }
    event ProductCreated(
        uint id,
        string name,
        uint price,
        address owner,
        bool purchased
    );
    function createProduct(string memory _name, uint _price) public {
        //required a valid name
        require(bytes(_name).length > 0, 'Invalid name');
        //required a valid price
        require(_price > 0,'Invalid price');
        // //make sure parameters are correct
        // //create the product
        // //trigger on evnet
        //increment product count
        productCount++;
        //create Products
        products[productCount] = Product(productCount,_name,_price,msg.sender,false);
        emit ProductCreated(productCount,_name,_price,msg.sender,false);
    }
}