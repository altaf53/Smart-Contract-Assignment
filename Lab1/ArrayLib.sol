// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayManipulationContract {
    uint[] public dataArray;
    mapping(uint => bool) private encountered;

    function addData(uint[] memory data) public {
        dataArray = data;
    }

    function sort() public {
        if (dataArray.length <= 1) {
            return;
        }

        for (uint i = 0; i < dataArray.length - 1; i++) {
            for (uint j = 0; j < dataArray.length - i - 1; j++) {
                if (dataArray[j] > dataArray[j + 1]) {
                    (dataArray[j], dataArray[j + 1]) = (dataArray[j + 1], dataArray[j]);
                }
            }
        }
    }

    function removeDuplicates() public {
        if (dataArray.length <= 1) {
            return;
        }

        uint[] memory uniqueArray = new uint[](dataArray.length);
        uint uniqueCount = 0;

        for (uint i = 0; i < dataArray.length; i++) {
            if (!encountered[dataArray[i]]) {
                uniqueArray[uniqueCount] = dataArray[i];
                encountered[dataArray[i]] = true;
                uniqueCount++;
            }
        }

        // Resize the original array to match the unique elements
        dataArray = new uint[](uniqueCount);
        for (uint i = 0; i < uniqueCount; i++) {
            dataArray[i] = uniqueArray[i];
        }
    }

    function getUpdatedArray() public view returns (uint[] memory) {
        return dataArray;
    }
}
