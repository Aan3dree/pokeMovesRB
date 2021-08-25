import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import { Button, View, TextInput, Image, ScrollView, FlatList } from 'react-native';
import styles from './src/styles';
import axios from 'axios';


export default function App() {
  
  const [moves, setMoves] = useState<string>("")
  const [name, setName] = useState<string>()

  function handleName(value: string) {
    setName(value);
    console.log(name)
  }
  

  function handleMoves() {
    

    axios.get(`https://pokeapi.co/api/v2/pokemon/${name?.toLowerCase()}`, {
      params:{
        _moves: moves
      }
    })
      .then(res => {
        const generation: string = res.data.moves[0].version_group_details[0].version_group.name;
        console.log(generation);
        setMoves(res.data.result);
        console.log(res)
      })
  }
  
  return (
    
      <View style={styles.container}>
        <View style={styles.logoWraper}>
          <Image 
            style={styles.logo}
            source={require('./src/assets/Img/logo.png')}
          /> 
        </View>
        <View style={styles.inputWraper}>
          <TextInput
            style={styles.input} 
            placeholder={'Nome do Pokemon'}
            //value={name}
            onChangeText={handleName}
          />
          <Button
            title="Buscar"
            onPress={() => handleMoves()}
            color="blue"
          />
        </View>
        <ScrollView>
          <FlatList>
            {}
          </FlatList>
        </ScrollView>
        <View style={styles.embaixo}>
          
        </View> 
        <StatusBar style="auto" />
      </View>
    
  );
}


