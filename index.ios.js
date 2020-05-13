import React from 'react';
import {AppRegistry, StyleSheet, Text, View} from 'react-native';

class RNHighScores extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.hello}>我是第一个页面，我进来了哦....</Text>
        </View>
    );
    }
}
const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
    },
    hello: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
});

AppRegistry.registerComponent('RNHighScores', () => RNHighScores);
