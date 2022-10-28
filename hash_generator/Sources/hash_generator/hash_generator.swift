import Foundation
import Crypto

func encryptUsingSha1(from input: String) -> String {
    let inputData = Data(input.utf8)
    let output = Insecure.SHA1.hash(data: inputData)
    return output.description
}

@main
public struct hash_generator {

    //POC V1
    /*public func json_generator(){
        var jsonString = "{\n"

        for i in 0...9 {
            jsonString += "   \"\(encryptUsingSha1(from: String(i)).suffix(40))\": \"\(String(i))\",\n"
        }
        for char in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
            if (char != "Z")
            {
                jsonString += "   \"\(encryptUsingSha1(from: String(char)).suffix(40))\": \"\(String(char))\",\n"
            }
            else
            {
                jsonString += "   \"\(encryptUsingSha1(from: String(char)).suffix(40))\": \"\(String(char))\"\n"
            }
        }

        jsonString += "}"

        do {
            try jsonString.write(toFile: "/code/hash_generator/hash_data2.json",
                atomically: true,
                encoding: .utf8)
        } 
        catch {
            print ("FFFFFFFFFFFFFFFFFFFFFF")
        }  
    }*/

    //POC V2
    public func json_generator(){
        var jsonString = "{\n"
        for c: Character in "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
            jsonString += "   \"\(encryptUsingSha1(from: String(c)).suffix(40))\": \"\(String(c))\",\n"
        }
        var str = ""
        var number = 1; //1->3844
        for i in "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
            for j in "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
                str = String(i)+String(j)
                if (number != 3844)
                {
                    jsonString += "   \"\(encryptUsingSha1(from: String(str)).suffix(40))\": \"\(String(str))\",\n"
                }
                else
                {
                    jsonString += "   \"\(encryptUsingSha1(from: String(str)).suffix(40))\": \"\(String(str))\"\n"
                }
                
                number += 1
            }
        }

        jsonString += "}"

        do {
            try jsonString.write(toFile: "./hash_data2.json",
                atomically: true,
                encoding: .utf8)
        } 
        catch {
            print ("FFFFFFFFFFFFFFFFFFFFFF")
        }  
    }

    public static func main() {
        hash_generator().json_generator()
    }
}
